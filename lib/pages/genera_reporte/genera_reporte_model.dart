import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'genera_reporte_widget.dart' show GeneraReporteWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GeneraReporteModel extends FlutterFlowModel{
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nameField widget.
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nameFieldController?.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
