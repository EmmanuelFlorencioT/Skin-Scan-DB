import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:skinscan/index.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:path/path.dart' show join;
import 'package:universal_platform/universal_platform.dart';

import 'package:skinscan/pages/camera_confirmation/camera_capture_confirmation_widget.dart';
import 'package:skinscan/pages/perfil/perfil_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'camera_model.dart';
export 'camera_model.dart';
String uuu="";
class CameraWidget extends StatefulWidget {
  final String uid;  
  const CameraWidget({ Key? key, required this.uid}) : super(key: key);
  
  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0; // Índice del elemento de cámara
  bool photo=false;
  late CameraController _controller;
  final String uid="";
  late Future<void> _initializeControllerFuture;
  XFile? _imageFile; // Variable to store the captured image
  String targetPath="";
  Widget ImageWidget = Image.network("");
  bool kIsWeb = const bool.fromEnvironment('dart.library.js_util');
  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
    _model = CameraModel(); // Crear una instancia de CameraModel
    _model.initState(context); // Inicializar el modelo si es necesario
  }
  @override
  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first; // Use la primera cámara disponible
    
    _controller = CameraController(camera, ResolutionPreset.ultraHigh);
    await _controller.initialize();
    if (!mounted) {
      return;
    }

    setState(() {});
  }
  
  Future<void> saveImageToAssets(String imagePath) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = 'snapshot.png';
    targetPath ="";
    //final targetPath = 'assets\\';
    // Copy the image to the assets location
    File(imagePath).copy(targetPath);

    // Notify the system that a new image has been added to the gallery
    await ImageGallerySaver.saveFile(targetPath);

    // You can show a notification or message to the user here
    //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Image saved in assets')));
  }
Future<void> ImageSave()async
{
    try {
      // Asegúrate que tu cámara esta inicializada
      await _initializeControllerFuture;

      // Construye la ruta donde la imagen se guardará
      // usando el plugin `path`.
      final path = join(
        // En este ejemplo, guarde la imagen en el directorio temporal. Encuentra 
        // el directorio temporal usando el plugin `path_provider`.
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );

      // Intenta tomar una foto y registrar donde se ha guardado
      await _controller.takePicture();
    } catch (e) {
      // Si se produce un error, regístralo en la consola.
      print(e);
    }
}
Future<void> saveImageLocally(XFile imageFile) async {
  final directory = await getTemporaryDirectory();
  final imagePath = '${directory.path}/snapshot.png';
  targetPath = imagePath;
  final imageFileBytes = File(imageFile.path).readAsBytesSync();
  File(imagePath).writeAsBytesSync(imageFileBytes);
  setState((){
  targetPath = imagePath;
  });
  // Ahora, la imagen se ha guardado localmente en el directorio temporal.
  // Puedes acceder a imagePath para usar la ubicación de la imagen guardada.
}
Future<void> pickImage() async{
  final picker = ImagePicker();
  try {
    final pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        _imageFile = pickedFiles.first;
      });
    } else {
      // El usuario canceló la selección, no hagas nada o muestra un mensaje.
    }
  } catch (e) {
    // Maneja cualquier error que pueda ocurrir durante la selección de imágenes.
    print('Error al seleccionar imágenes: $e');
  }
}
 Future<void> _takePicture() async {
    if (!_controller.value.isInitialized) {
      return;
    }

    try {
      final XFile imageFile = await _controller.takePicture();
      setState(() {
        _imageFile = imageFile;
      });
// Obtén el directorio de documentos de la aplicación
      final appDocDir = await getApplicationDocumentsDirectory();

      // Construye la ruta donde la imagen se guardará
      final imagePath = '${appDocDir.path}/snapshot.png';

      // Guarda la imagen en la ubicación deseada
      File(imageFile.path).copy(imagePath);

      setState(() {
        _imageFile = XFile(imagePath);
      });
    } catch (e) {
      print("Error capturing the image: $e");
    }
  }
Widget getPickFileWidget(){
  if (_imageFile == null) {
    if (kIsWeb) {
      return Image.network(_imageFile!.path,
                fit: BoxFit.cover,);
    } else {
      return Image.file(File(_imageFile!.path),
                fit: BoxFit.cover,);
    }
  } else {
    return CameraPreview(_controller);
  }  
}

Widget getImageWidget() {
  if (_imageFile != null) {
    if (kIsWeb) {
      return Image.network(_imageFile!.path,
                fit: BoxFit.cover,);
    } else {
      return Image.file(File(_imageFile!.path),
                fit: BoxFit.cover,);
    }
  } else {
    return CameraPreview(_controller);
  }
}



  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
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
                mainAxisAlignment: MainAxisAlignment.center,
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
              if (!photo)
              
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      photo = true;
                      setState(() {
                        photo;
                      });
                    //  Navigator.push(
                    //  context,
                    //  MaterialPageRoute(builder: (context) => Camera()),
                    //);
                    },
                    text: 'Tomar una imagen',
                    options: FFButtonOptions(
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Color(0xFF10CAC4),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                if (!photo)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: FFButtonWidget(
                    onPressed: ()async {
                      await pickImage();
                      if(_imageFile!=null){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CameraCaptureConfirmationWidget(Xfile: _imageFile,uid: widget.uid)),
                    );}
                    },
                    text: 'Subir imagen',
                    icon: Icon(
                      Icons.file_upload_outlined,
                      size: 15,
                    ),
                    options: FFButtonOptions(
                      width: 210,
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Color(0xFF767676),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ) 
              else
                FutureBuilder(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (_controller == null || !_controller.value.isInitialized) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if(_imageFile!=null){
                      return Center(
              child: 
              getImageWidget()
              /*Image.network(
                _imageFile!.path,
                fit: BoxFit.cover,
              )*/,
                      );
                    }else
                    {
                    return Center(
                      child: Container(
              width: MediaQuery.of(context).size.height*0.8,
              height: MediaQuery.of(context).size.height*0.6,
              child:CameraPreview(_controller,child:                 Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(75, 380, 75, 25),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await _takePicture();
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CameraCaptureConfirmationWidget(Xfile: _imageFile,uid: widget.uid)),
                    );
                    },
                    text: 'Toma imagen',
                    options: FFButtonOptions(
                      height:40,
                      width: 50,
                      padding: EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Color(0xFF10CAC4),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),),
                      ), 
                      
                      
                      
                    );
                    }
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),

              //condicion inicia
              //condicion termina
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
        setState(() {
        uuu = widget.uid;  
        });
        
        // Navegar a la página de perfil (PerfilWidget) o lo que desees.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  PerfilWidget(uid: uuu,),
          ),
        );
      }
    });
  },
)
,
      ),
    );
  }
}
/*

//import 'reporte_model.dart';
//export 'reporte_model.dart';
class Camera extends StatefulWidget {
  @override
  State<Camera> createState() => CameraPage();
}

class CameraPage extends State<Camera> {  

  late CameraController _controller;
  final String uid="";
  int _selectedIndex =1;
  late Future<void> _initializeControllerFuture;
  XFile? _imageFile; // Variable to store the captured image
  String targetPath="";
  Widget ImageWidget = Image.network("");
  bool kIsWeb = const bool.fromEnvironment('dart.library.js_util');
  @override
  // TODO: implement widget
  Camera get widget => super.widget;
  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first; // Use la primera cámara disponible
    
    _controller = CameraController(camera, ResolutionPreset.ultraHigh);
    await _controller.initialize();
    if (!mounted) {
      return;
    }

    setState(() {});
  }
  
  Future<void> saveImageToAssets(String imagePath) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = 'snapshot.png';
    targetPath ="";
    //final targetPath = 'assets\\';
    // Copy the image to the assets location
    File(imagePath).copy(targetPath);

    // Notify the system that a new image has been added to the gallery
    await ImageGallerySaver.saveFile(targetPath);

    // You can show a notification or message to the user here
    //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Image saved in assets')));
  }
Future<void> ImageSave()async
{
    try {
      // Asegúrate que tu cámara esta inicializada
      await _initializeControllerFuture;

      // Construye la ruta donde la imagen se guardará
      // usando el plugin `path`.
      final path = join(
        // En este ejemplo, guarde la imagen en el directorio temporal. Encuentra 
        // el directorio temporal usando el plugin `path_provider`.
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );

      // Intenta tomar una foto y registrar donde se ha guardado
      await _controller.takePicture();
    } catch (e) {
      // Si se produce un error, regístralo en la consola.
      print(e);
    }
}
Future<void> saveImageLocally(XFile imageFile) async {
  final directory = await getTemporaryDirectory();
  final imagePath = '${directory.path}/snapshot.png';
  targetPath = imagePath;
  final imageFileBytes = File(imageFile.path).readAsBytesSync();
  File(imagePath).writeAsBytesSync(imageFileBytes);
  
  setState((){
  targetPath = imagePath;
  });
  // Ahora, la imagen se ha guardado localmente en el directorio temporal.
  // Puedes acceder a imagePath para usar la ubicación de la imagen guardada.
}
 Future<void> _takePicture() async {
    if (!_controller.value.isInitialized) {
      return;
    }

    try {
      final XFile imageFile = await _controller.takePicture();
      setState(() {
        _imageFile = imageFile;
      });
// Obtén el directorio de documentos de la aplicación
      final appDocDir = await getApplicationDocumentsDirectory();

      // Construye la ruta donde la imagen se guardará
      final imagePath = '${appDocDir.path}/snapshot.png';

      // Guarda la imagen en la ubicación deseada
      File(imageFile.path).copy(imagePath);

      setState(() {
        _imageFile = XFile(imagePath);
      });
    } catch (e) {
      print("Error capturing the image: $e");
    }
  }
Widget getImageWidget() {
  if (_imageFile != null) {
    if (kIsWeb) {
      return Image.network(_imageFile!.path,
                fit: BoxFit.cover,);
    } else {
      return Image.file(File(_imageFile!.path),
                fit: BoxFit.cover,);
    }
  } else {
    return CameraPreview(_controller);
  }
}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Cámara'),
      ),
      
body: targetPath != ""
          ? Center(
              child: Image.asset(
                'assets/images/favicon.png',
                fit: BoxFit.cover,
              ),
            )
          : FutureBuilder(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (_controller == null || !_controller.value.isInitialized) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if(_imageFile!=null){
                      return Center(
              child: 
              getImageWidget()
              /*Image.network(
                _imageFile!.path,
                fit: BoxFit.cover,
              )*/,
                      );
                    }else
                    {
                    return Center(
                      child: CameraPreview(_controller),
                      
                    );
                    }
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
           bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
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
            selectedItemColor: const Color.fromRGBO(16, 202, 196, 1),
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReporteWidget(
                          uid: "",
                        )),
                  );

                } 
                else if(index==1){
              if (_imageFile == null) {
                _takePicture();
                
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>CameraCaptureConfirmationWidget(Xfile: _imageFile,uid: ))
                );
                
               // saveImageLocally(_imageFile!);
              }
                }
                 else if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PerfilWidget(
                              uid: "",
                            )),
                  );
                }
              });
            },
          ),

    );

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

*/