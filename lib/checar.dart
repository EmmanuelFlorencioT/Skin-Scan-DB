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
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' show Platform;

import 'package:skinscan/pages/SpotDetector.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final imagePicker = ImagePicker();

  ObjectDetection? objectDetection;

  Uint8List? image;

  @override
  void initState() {
    super.initState();
    objectDetection = ObjectDetection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/tfl_logo.png'),
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: (image != null) ? Image.memory(image!) : Container(),
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (Platform.isAndroid || Platform.isIOS)
                    IconButton(
                      onPressed: () async {
                        final result = await imagePicker.pickImage(
                          source: ImageSource.camera,
                        );
                        if (result != null) {
                          image = objectDetection!.analyseImage(result.path);
                          setState(() {});
                        }
                      },
                      icon: const Icon(
                        Icons.camera,
                        size: 64,
                      ),
                    ),
                  IconButton(
                    onPressed: () async {
                      final result = await imagePicker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (result != null) {
                        print('Image uploaded');
                        image = objectDetection!.analyseImage(result.path);
                        print(image?.length.toString());
                        setState(() {});
                      }
                    },
                    icon: const Icon(
                      Icons.photo,
                      size: 64,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
