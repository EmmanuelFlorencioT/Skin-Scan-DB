import 'package:flutter/material.dart';
import 'package:skinscan/firebase_options.dart';
import 'package:skinscan/index.dart';
import 'package:skinscan/nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:skinscan/pages/home_page/home_page_widget.dart';
import 'package:skinscan/pages/perfil/perfil_widget.dart';
import 'package:skinscan/pages/registrate/registrate_widget.dart';
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skin Scan',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePageWidget(),
        '/registrar': (context) => const RegistrateWidget(),
        '/iniciarSesion': (context) => const IniciarSesionWidget(),
        //'/perfil': (context) => PerfilWidget(),
      },
    );
  }

  static of(BuildContext context) {}
}
