import 'package:skinscan/pages/camera/camera_widget.dart';
import 'package:skinscan/pages/perfil/perfil_widget.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'camera_r_g_model.dart';
export 'camera_r_g_model.dart';

class CameraRGWidget extends StatefulWidget {
  final String uid;
  const CameraRGWidget({required this.uid, Key? key}) : super(key: key);

  @override
  _CameraRGWidgetState createState() => _CameraRGWidgetState();
}

class _CameraRGWidgetState extends State<CameraRGWidget> {
  late CameraRGModel _model;


  int _selectedIndex = 0; 

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraRGModel());
  }

   @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  'No Dañino',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: Color.fromRGBO(48, 140, 137, 1),
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
            builder: (context) => PerfilWidget(uid: widget.uid,),
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
