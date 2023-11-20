import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'camera_widget.dart' show CameraWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';

class FlutterFlowModel<T> {
  // Puedes definir propiedades y métodos aquí según tus necesidades.
}

class CameraModel extends FlutterFlowModel<CameraWidget> {
  // Definiciones de campos y métodos específicos para CameraModel.
  // Por ejemplo, puedes definir campos como unfocusNode y métodos como initState y dispose aquí.
  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
  FFUploadedFile(bytes: Uint8List.fromList([]));

  void initState(BuildContext context) {
    // Lógica de inicialización
  }

  void dispose() {
    // Lógica de disposición
    unfocusNode.dispose();
  }

  // Puedes agregar más campos y métodos según sea necesario.
}
