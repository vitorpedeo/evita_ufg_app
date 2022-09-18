import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EvitaUFGApp extends StatelessWidget {
  const EvitaUFGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Evita UFG',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}

void main() {
  runApp(const EvitaUFGApp());
}
