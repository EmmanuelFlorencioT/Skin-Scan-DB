import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistrateModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for correoField widget.
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // State field(s) for correoField widget.
  TextEditingController? correoFieldController;
  String? Function(BuildContext, String?)? correoFieldControllerValidator;
  // State field(s) for contrasena1Field widget.
  TextEditingController? contrasena1FieldController;
  late bool contrasena1FieldVisibility;
  String? Function(BuildContext, String?)? contrasena1FieldControllerValidator;
  // State field(s) for contrasena2Field widget.
  TextEditingController? contrasena2FieldController;
  late bool contrasena2FieldVisibility;
  String? Function(BuildContext, String?)? contrasena2FieldControllerValidator;
  // State field(s) for cedulaField widget.
  TextEditingController? cedulaFieldController;
  String? Function(BuildContext, String?)? cedulaFieldControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    contrasena1FieldVisibility = false;
    contrasena2FieldVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    nameFieldController?.dispose();
    correoFieldController?.dispose();
    contrasena1FieldController?.dispose();
    contrasena2FieldController?.dispose();
    cedulaFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
