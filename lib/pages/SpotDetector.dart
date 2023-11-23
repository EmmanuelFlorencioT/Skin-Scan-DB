/*
* Copyright 2023 The TensorFlow Authors. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*             http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import 'dart:developer';
import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

class ObjectDetection {
  static const String _modelPath = 'assets/images/model_latest.tflite';
  static const String _labelPath = 'assets/images/labels.txt';

  Interpreter? _interpreter;
  List<String>? _labels;
  Completer<void> _initializationCompleter = Completer<void>();

  ObjectDetection() {
    initializeSpotDetector();
    log('Done.');
  }

  Future<void> initializeSpotDetector() async {
    await _loadLabels();
    await _loadModel();
    _initializationCompleter.complete();
    log('Done.');
  }

  Future<void> _loadModel() async {
    print('Loading interpreter options...');
    final interpreterOptions = InterpreterOptions();

    // Use XNNPACK Delegate
    if (Platform.isAndroid) {
      interpreterOptions.addDelegate(XNNPackDelegate());
    }

    // Use Metal Delegate
    if (Platform.isIOS) {
      interpreterOptions.addDelegate(GpuDelegate());
    }

    try {
      _interpreter =
          await Interpreter.fromAsset(_modelPath, options: interpreterOptions);
      print("Model Loaded Successfully!!!!!!");
      print(_interpreter!.getInputTensor(0).shape);
    } catch (e) {
      print("Error while leading the interpreter!");
    }
  }

  Future<void> _loadLabels() async {
    print('Loading labels...');
    final labelsRaw = await rootBundle.loadString(_labelPath);
    _labels = labelsRaw.split('\n');
  }

  Future<String> analyseImage(String imagePath) async {
    await _initializationCompleter.future;

    print('Analysing image...');
    // Reading image bytes from file
    final imageData = File(imagePath).readAsBytesSync();

    // Decoding image
    final image = img.decodeImage(imageData);

    // Resizing image fpr model, [300, 300]
    final imageInput = img.copyResize(
      image!,
      width: 224,
      height: 224,
    );

    // Creating matrix representation, [224, 224, 3]
    final imageMatrix = List.generate(
      imageInput.height,
      (y) => List.generate(
        imageInput.width,
        (x) {
          final pixel = imageInput.getPixel(x, y);
          return [pixel.r, pixel.g, pixel.b];
        },
      ),
    );

    final output = _runInference(imageMatrix);

    final predictionResult = output[0] as List<double>;
    double maxElement = predictionResult.reduce(
      (double maxElement, double element) =>
          element > maxElement ? element : maxElement,
    );

    double levelOfConfidence = maxElement * 100;
    Future<String> result = Future<String>.delayed(
        const Duration(seconds: 1),
        () =>
            //Concatenation of label and level of confidence
            "${_labels![predictionResult.indexOf(maxElement)]}#${levelOfConfidence.toStringAsFixed(2)}");

    return result;
  }

  List<List<num>> _runInference(
    List<List<List<num>>> imageMatrix,
  ) {
    print('Running inference...');

    // Set input tensor [1, 224, 224, 3]
    final input = [imageMatrix];
    log(input.toString());

    final output = [List<num>.filled(7, 0)];

    _interpreter!.run(input, output);
    log(output.toString());
    return output;
  }
}
