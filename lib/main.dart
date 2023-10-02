import 'package:flutter/material.dart';
import 'package:skinscan/firebase_options.dart';
import 'package:skinscan/index.dart';
import 'package:skinscan/nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:skinscan/pages/genera_reporte/genera_reporte_widget.dart';
import 'package:skinscan/pages/home_page/home_page_widget.dart';
import 'package:skinscan/pages/perfil/perfil_widget.dart';
import 'package:skinscan/pages/registrate/registrate_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skin Scan',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const GeneraReporteWidget(),
        '/registrar': (context) => const RegistrateWidget(),
        '/iniciarSesion': (context) => const IniciarSesionWidget(),
        //'/perfil': (context) => PerfilWidget(),
      },
    );
  }

  static of(BuildContext context) {}
}
