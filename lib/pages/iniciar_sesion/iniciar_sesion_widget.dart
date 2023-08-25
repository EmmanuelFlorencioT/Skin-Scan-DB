import 'package:firebase_auth/firebase_auth.dart';
import 'package:skinscan/pages/registrate/registrate_widget.dart';

import '../home_page/home_page_widget.dart';
import '../perfil/perfil_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'iniciar_sesion_model.dart';
export 'iniciar_sesion_model.dart';

class IniciarSesionWidget extends StatefulWidget {
  const IniciarSesionWidget({Key? key}) : super(key: key);

  @override
  _IniciarSesionWidgetState createState() => _IniciarSesionWidgetState();
}

class _IniciarSesionWidgetState extends State<IniciarSesionWidget> {
  late IniciarSesionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IniciarSesionModel());

    _model.correoFieldController ??= TextEditingController();
    _model.contrasena1FieldController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageWidget()),
                );
                //context.pushNamed('HomePage');
              },
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
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
                                      40.0, 0.0, 40.0, 0.0),
                                  child: Container(
                                    width:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width * 1.0,
                                    height: 62.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                    child: Align(
                                      alignment:
                                      AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        'Inicia Sesión',
                                        style: FlutterFlowTheme
                                            .of(context)
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40.0, 0.0, 40.0, 25.0),
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: TextFormField(
                                        controller:
                                        _model.correoFieldController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Correo',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF767676),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF767676),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme
                                                  .of(context)
                                                  .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                          OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme
                                                  .of(context)
                                                  .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor: Color(0x00FFFFFF),
                                        ),
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF767676),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        keyboardType:
                                        TextInputType.emailAddress,
                                        validator: _model
                                            .correoFieldControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40.0, 0.0, 40.0, 25.0),
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: TextFormField(
                                        controller:
                                        _model.contrasena1FieldController,
                                        obscureText:
                                        !_model.contrasena1FieldVisibility,
                                        decoration: InputDecoration(
                                          hintText: 'Contraseña',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF767676),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF767676),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme
                                                  .of(context)
                                                  .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                          OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme
                                                  .of(context)
                                                  .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor: Color(0x00FFFFFF),
                                          suffixIcon: InkWell(
                                            onTap: () =>
                                                setState(
                                                      () =>
                                                  _model
                                                      .contrasena1FieldVisibility =
                                                  !_model
                                                      .contrasena1FieldVisibility,
                                                ),
                                            focusNode:
                                            FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.contrasena1FieldVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                  .visibility_off_outlined,
                                              color: Color(0xFF757575),
                                              size: 22.0,
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF767676),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        keyboardType:
                                        TextInputType.visiblePassword,
                                        validator: _model
                                            .contrasena1FieldControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40.0, 0.0, 40.0, 25.0),
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                visualDensity:
                                                VisualDensity.compact,
                                                materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      4.0),
                                                ),
                                              ),
                                              unselectedWidgetColor:
                                              FlutterFlowTheme
                                                  .of(context)
                                                  .secondaryText,
                                            ),
                                            child: Checkbox(
                                              value: _model.checkboxValue ??=
                                              false,
                                              onChanged: (newValue) async {
                                                setState(() =>
                                                _model
                                                    .checkboxValue = newValue!);
                                              },
                                              activeColor: Color(0xFF767676),
                                              checkColor:
                                              FlutterFlowTheme
                                                  .of(context)
                                                  .info,
                                            ),
                                          ),
                                          Text(
                                            'Recordarme',
                                            style: FlutterFlowTheme
                                                .of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Readex Pro',
                                              color: Color(0xFF767676),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 25.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        try {
                                          final userCredential =
                                          await FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                            email: _model
                                                .correoFieldController.text,
                                            password: _model
                                                .contrasena1FieldController
                                                .text,
                                          );
                                          final userID =
                                              userCredential.user?.uid;
                                          if (userID != null) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PerfilWidget(
                                                      uid: userID,
                                                    ),
                                              ),
                                            );
                                          }
                                        } catch (error) {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text('Error'),
                                                content: Text(
                                                    'Correo o contraseña incorrectos.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    child: const Text('Aceptar',
                                                      style: TextStyle(
                                                          color:Color(0xFF10CAC4)),),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          print(
                                              'Error al iniciar sesión: $error');
                                        }
                                      },
                                      text: 'Iniciar Sesión',
                                      options: FFButtonOptions(
                                        width: 258.0,
                                        height: 43.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF10CAC4),
                                        textStyle: FlutterFlowTheme
                                            .of(context)
                                            .titleSmall
                                            .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40.0, 0.0, 40.0, 25.0),
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '¿No tienes cuenta aún?',
                                                style: FlutterFlowTheme
                                                    .of(
                                                    context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFF767676),
                                                  fontSize: 12.0,
                                                  fontWeight:
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            RegistrateWidget()),
                                                  );
                                                  print('Button pressed ...');
                                                },
                                                text: 'Registrarse',
                                                options: FFButtonOptions(
                                                  width: 150.0,
                                                  height: 43.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(0.0, 0.0,
                                                      0.0, 0.0),
                                                  color: Colors.white,
                                                  textStyle: FlutterFlowTheme
                                                      .of(context)
                                                      .titleSmall
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color:
                                                    Color(0xFF767676),
                                                  ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20.0),
                                                ),
                                              ),
                                            ],
                                          ),
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
      ),
    );
  }
}
