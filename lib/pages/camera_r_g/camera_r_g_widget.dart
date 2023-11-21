import 'package:skinscan/pages/camera/camera_widget.dart';
import 'package:skinscan/pages/perfil/perfil_widget.dart';
import 'dart:io';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as TFLiteF;
import 'package:skinscan/pages/SpotDetector.dart';
import 'camera_r_g_model.dart';
import 'package:camera/camera.dart';
import 'package:skinscan/index.dart';
export 'camera_r_g_model.dart';

class CameraRGWidget extends StatefulWidget {
  final String uid;
  final XFile? Xfile;
  const CameraRGWidget({required this.Xfile,required this.uid, Key? key}) : super(key: key);

  @override
  _CameraRGWidgetState createState() => _CameraRGWidgetState();
}

class _CameraRGWidgetState extends State<CameraRGWidget> {
  late CameraRGModel _model;
  String? labell;
  ObjectDetection? objectdetection;
  int _selectedIndex = 0; 
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool kIsWeb = const bool.fromEnvironment('dart.library.js_util');


  @override
  void initState()  {
    super.initState();
    _model = createModel(context, () => CameraRGModel());
    objectdetection = ObjectDetection();
  }
   @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }
  

  @override
  
  Widget build(BuildContext context) {
    XFile? _imageFile = widget.Xfile;
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

    //labell = (_imageFile!=null) ? objectdetection!.analyseImage(_imageFile.path) : null;
    return  GestureDetector(
      
      onTap: () => _model.unfocusNode.canRequestFocus
          
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: (labell!=null) ? SafeArea(
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 280,
                    child: getImageWidget(),
                  ), 
                  ),
                
                
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
                (labell!),
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
        )
        : Center(
          
          child: InkWell(onTap: () {
    if (_imageFile != null) {
      labell = objectdetection!.analyseImage(_imageFile.path);
    } else {
      // Puedes manejar el caso cuando _imageFile es null aquí si es necesario
      // Por ejemplo, mostrar un mensaje de error, etc.
    }
setState(() {});
},
child:
CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF10CAC4)),
              semanticsLabel: 'Circular progress indicator',
            ),
        ),),
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
