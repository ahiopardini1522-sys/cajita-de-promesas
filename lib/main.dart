import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pantallas/pantalla_cajita.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const CajitaDePromesasApp());
}

class CajitaDePromesasApp extends StatelessWidget {
  const CajitaDePromesasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cajita de Promesas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB83242)),
      ),
      home: const PantallaCajita(),
    );
  }
}
