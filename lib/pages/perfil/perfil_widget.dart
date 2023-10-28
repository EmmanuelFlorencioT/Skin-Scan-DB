import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skinscan/pages/camera/camera_widget.dart';

import '../reporte/reporte_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'perfil_model.dart';
export 'perfil_model.dart';

class PerfilWidget extends StatefulWidget {
  final String uid;

  const PerfilWidget({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  _PerfilWidgetState createState() => _PerfilWidgetState();
}

class _PerfilWidgetState extends State<PerfilWidget> {
  late PerfilModel _model;
  late String nombre;
  late String cedula;
  int _selectedIndex = 1; // Índice del elemento de perfil
  bool isLoading = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilModel());
    obtenerInformacionDoctor();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> obtenerInformacionDoctor() async {
    try {
      final doctorSnapshot = await FirebaseFirestore.instance
          .collection('Doctores')
          .doc(widget.uid)
          .get();

      if (doctorSnapshot.exists) {
        final doctorData = doctorSnapshot.data() as Map<String, dynamic>;
        nombre = doctorData['nombre'];
        cedula = doctorData['cedula'];
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error al obtener información del doctor: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

@override
Widget build(BuildContext context) {
  if (isLoading) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF10CAC4)),
            semanticsLabel: 'Circular progress indicator',
          ),
        ),
      ),
    );
  } else {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
          child: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('HomePage');
            },
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // El resto de su contenido del perfil...
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
  selectedItemColor: const Color.fromRGBO(16, 202, 196, 1),
  onTap: (int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CameraWidget(
              
            ),
          ),
        );
      } else if (index == 1) {
        //Navigator.push(
          //context,
          ///MaterialPageRoute(
        //    builder: (context) => CameraWidget(), // Cambia a CameraWidget
         // ),
       // );
      } 
    });
  },
),
    );
  }
}

}
