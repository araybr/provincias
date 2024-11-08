import 'package:flutter/material.dart';
import 'login.dart';
import 'comarques.dart';
import 'provinces.dart';
import 'info_comarca_1.dart';
import 'info_comarca_2.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Comarcas',
      home: Scaffold(
          appBar: AppBar(
              title: const Text(
                'Comarcas',
              ),
              centerTitle: false, // Esto centrará el título en la AppBar
          ),
          //body: const LoginScreen())));
          //body: const ProvinciasScreen())));
          //body: const ComarquesScreen())));
          body: const InfoComarca1Screen())));
          //body: const InfoComarca2Screen())));
}