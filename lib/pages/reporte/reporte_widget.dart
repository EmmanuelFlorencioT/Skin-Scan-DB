import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../perfil/perfil_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'reporte_model.dart';
export 'reporte_model.dart';

class ReporteWidget extends StatefulWidget {
  final String uid;

  const ReporteWidget({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<ReporteWidget> createState() => _ReporteWidgetState();
}

class _ReporteWidgetState extends State<ReporteWidget> {
  late ReporteModel _model;
  int _selectedIndex = 0; // Índice del elemento de reporte
  bool isLoading = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReporteModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
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
      return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SafeArea(
              top: true,
              child: Scaffold(
                body: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 44.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40.0, 40.0, 40.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          1.0,
                                      height: 62.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                      ),
                                      child: Align(
                                        alignment:
                                        AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          'Reportes',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF767676),
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    /*Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40.0, 0.0, 40.0, 25.0),
                                      child: Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            1.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'UID:',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily:
                                                    'Readex Pro',
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    widget.uid,
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Color(0xFF767676),
                                                      fontSize: 20.0,
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),*/
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40.0, 0.0, 40.0, 25.0),
                                      child: Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            1.0,
                                        height: 70.0, // Establece una altura fija para el ListView horizontal
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: <Widget>[
                                            Container(
                                              margin: const EdgeInsets.only(right: 25),
                                              child: Card(
                                                color: const Color(767676),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                child: Container(
                                                  width: 120.0,
                                                  child: const Column(
                                                    mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.all(8.0),
                                                        child: Align(
                                                          alignment: Alignment.center, // Centra horizontalmente
                                                          child: Text(
                                                            'Item 1',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                            ),// Alinea el texto al centro
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(right: 25),
                                              child: Card(
                                                color: Colors.white,
                                                //elevation: 3,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                child: Container(
                                                  width: 120.0,
                                                  child: const Column(
                                                    mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.all(8.0),
                                                        child: Align(
                                                          alignment: Alignment.center, // Centra horizontalmente
                                                          child: Text(
                                                            'Item 1',
                                                            textAlign: TextAlign.center, // Alinea el texto al centro
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(right: 25),
                                              child: Card(
                                                color: Colors.white,
                                                //elevation: 3,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                child: Container(
                                                  width: 120.0,
                                                  child: const Column(
                                                    mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.all(8.0),
                                                        child: Align(
                                                          alignment: Alignment.center, // Centra horizontalmente
                                                          child: Text(
                                                            'Item 1',
                                                            textAlign: TextAlign.center, // Alinea el texto al centro
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 25.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            buildReporte("[Contenido Dinámico]"),
                                            buildReporte("[Contenido Dinámico]"),
                                            buildReporte("[Contenido Dinámico]"),
                                            buildReporte("[Contenido Dinámico]"),
                                            buildReporte("[Contenido Dinámico]"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
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
                          uid: widget.uid,
                        )),
                  );
                } else if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PerfilWidget(
                          uid: widget.uid,
                        )),
                  );
                }
              });
            },
          ),
        ),
      );
    }
  }

  Widget buildReporte(String text) => Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                height: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          text,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          text,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    ],
  );

  /*Widget buildReporte(String text) => Container(
    margin: EdgeInsets.only(bottom: 10),
    child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          height: 100,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    text,
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    text,
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );*/
}
