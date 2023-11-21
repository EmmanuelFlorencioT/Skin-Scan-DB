import 'package:skinscan/pages/SpotDetector.dart';
import 'package:skinscan/pages/camera/camera_widget.dart';
import 'package:skinscan/pages/perfil/perfil_widget.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:skinscan/index.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:path/path.dart' show join;
import 'package:universal_platform/universal_platform.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'camera_r_b_model.dart';
export 'camera_r_b_model.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class CameraRBWidget extends StatefulWidget {
  final XFile? Xfile;
  final String uid;
  const CameraRBWidget({required this.Xfile,required this.uid,Key? key}) : super(key: key);

  @override
  _CameraRBWidgetState createState() => _CameraRBWidgetState();
}

class _CameraRBWidgetState extends State<CameraRBWidget> {
  late CameraRBModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool kIsWeb = const bool.fromEnvironment('dart.library.js_util');
  int _selectedIndex = 0; 

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraRBModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    XFile? _imageFile = widget.Xfile;
    
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }
@override
Widget getImageWidget() {
  if (_imageFile != null) {
    if (kIsWeb) {
      return Image.network(_imageFile!.path,
                fit: BoxFit.cover);
    } else {
      return Image.file(File(_imageFile!.path),
                fit: BoxFit.cover,);
    }
  } else {
    //return CameraPreview(_controller);
    return Container();
  }
}

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 72),
                      child: Text(
                        'Escaner',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF767676),
                          fontSize: 50,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                child: Text(
                  'Dañino',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFFEA2A2A),
                        fontSize: 30.0,
                      ),
                ),
              ),
              Text(
                'Melanoma (90%)',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF767676),
                      fontSize: 20.0,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () {
                    // print('Button pressed ...');
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CameraWidget(uid: widget.uid)),
                  );
                  },
                  text: 'Escanear otra vez',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF10CAC4),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.camera_alt),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: '',
    ),
  ],
  currentIndex: _selectedIndex, // Establecer el índice seleccionado
  selectedItemColor: Color(0xFF10CAC4), // Cambia el color de ítem seleccionado
  onTap: (int index) {
    setState(() {
      if (index == 0) {
        // Navegar a la página de cámara actual.
      } else if (index == 1) {
        // Navegar a la página de perfil (PerfilWidget) o lo que desees.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  PerfilWidget(uid: widget.uid,),
          ),
        );
      }
    });
  },
)
      ),
    );
  }
}
