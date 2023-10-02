import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'genera_reporte_model.dart';
export 'genera_reporte_model.dart';

class GeneraReporteWidget extends StatefulWidget {
  const GeneraReporteWidget({Key? key}) : super(key: key);

  @override
  _GeneraReporteWidgetState createState() => _GeneraReporteWidgetState();
}

class _GeneraReporteWidgetState extends State<GeneraReporteWidget> {
  late GeneraReporteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GeneraReporteModel());

    _model.nameFieldController ??= TextEditingController();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 62,
                            decoration: BoxDecoration(
                              color: Color(0x00FFFFFF),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Text(
                                'Genera reporte',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF767676),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                              padding:
                              EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(),
                                child: TextFormField(
                                  controller: _model.nameFieldController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Nombre(s)',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF767676),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF767676),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme.of(context).error,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme.of(context).error,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    filled: true,
                                    fillColor: Color(0x00FFFFFF),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF767676),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  validator: _model.nameFieldControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                            padding: 
                            EdgeInsetsDirectional.fromSTEB(0,25, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Expanded(
                                flex: 4, // Este flex controla el 40% del ancho
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(40, 0, 10, 25),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: TextFormField(
                                      //controller: _model.firstFieldController, // Debes crear el controlador
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Primer Apellido',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF767676),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF767676),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        filled: true,
                                        fillColor: Color(0x00FFFFFF),
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFF767676),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      //validator: _model.firstFieldControllerValidator.asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4, // Este flex controla el 40% del ancho
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 40, 25),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: TextFormField(
                                      //controller: _model.secondFieldController, // Debes crear el controlador
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Segundo apellido',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF767676),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF767676),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        filled: true,
                                        fillColor: Color(0x00FFFFFF),
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFF767676),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      //validator: _model.secondFieldControllerValidator.asValidator(context),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                            
                            ),
                          Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Expanded(
                                flex: 3, // Este flex controla el 40% del ancho
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(40, 0, 8, 25),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: TextFormField(
                                      //controller: _model.firstFieldController, // Debes crear el controlador
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Edad',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF767676),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF767676),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        filled: true,
                                        fillColor: Color(0x00FFFFFF),
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFF767676),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      //validator: _model.firstFieldControllerValidator.asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3, // Este flex controla el 40% del ancho
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 25),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: TextFormField(
                                      //controller: _model.secondFieldController, // Debes crear el controlador
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Peso',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF767676),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF767676),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        filled: true,
                                        fillColor: Color(0x00FFFFFF),
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFF767676),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      //validator: _model.secondFieldControllerValidator.asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3, // Este flex controla el 40% del ancho
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 40, 25),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: TextFormField(
                                      //controller: _model.secondFieldController, // Debes crear el controlador
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Altura',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF767676),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF767676),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        filled: true,
                                        fillColor: Color(0x00FFFFFF),
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFF767676),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      //validator: _model.secondFieldControllerValidator.asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),               
                          ),
                            Padding(
                            padding: 
                            EdgeInsetsDirectional.fromSTEB(0,0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Expanded(
                                flex: 4, // Este flex controla el 40% del ancho
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(40, 0, 10, 25),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: TextFormField(
                                      //controller: _model.firstFieldController, // Debes crear el controlador
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Sexo',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF767676),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF767676),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        filled: true,
                                        fillColor: Color(0x00FFFFFF),
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFF767676),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      //validator: _model.firstFieldControllerValidator.asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4, // Este flex controla el 40% del ancho
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 40, 25),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: TextFormField(
                                      //controller: _model.secondFieldController, // Debes crear el controlador
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Tiempo de la mancha',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF767676),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF767676),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        filled: true,
                                        fillColor: Color(0x00FFFFFF),
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFF767676),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      //validator: _model.secondFieldControllerValidator.asValidator(context),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                            
                            ),

                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(40, 0, 40, 25),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(),
                                child: TextFormField(
                                  controller: _model.nameFieldController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Enfermedades',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF767676),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF767676),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme.of(context).error,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme.of(context).error,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    filled: true,
                                    fillColor: Color(0x00FFFFFF),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF767676),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  validator: _model.nameFieldControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Guardar',
                                options: FFButtonOptions(
                                  width: 258,
                                  height: 43,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: Color(0xFF10CAC4),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
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
            ],
          ),
        ),
      ),
    );
  }
}
