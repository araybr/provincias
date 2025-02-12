import 'dart:io';
import 'dart:convert'; // Per realitzar conversions entre tipus de dades
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Per realitzar peticions HTTP

Future<dynamic> obteClima(
    {required double longitud, required double latitud}) async {
  String url =
      'https://api.open-meteo.com/v1/forecast?latitude=$longitud&longitude=$latitud&current_weather=true';

  // Llancem una petició GET mitjançant el mètode http.get, i ens esperem a la resposta
  http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == HttpStatus.ok) {
    // Descodifiquem la resposta
    String body = utf8.decode(response.bodyBytes);
    final result = jsonDecode(body);
    // I la tornem
    return result;
  } else {
    // Si no carrega, llancem una excepció
    throw Exception('No s\'ha pogut connectar');
  }
}

Future<List> obtenirComarques(String provincia) async {
  String url =
      "https://node-comarques-rest-server-production.up.railway.app/api/comarques/$provincia";
  http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == HttpStatus.ok) {
    String body = utf8.decode(response.bodyBytes);
    final result = jsonDecode(body);
    return result;
  } else {
    throw Exception('No s\'ha pogut connectar');
  }
}

Future<List> obtenirProvincies() async {
  String url =
      "https://node-comarques-rest-server-production.up.railway.app/api/comarques";
  http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == HttpStatus.ok) {
    String body = utf8.decode(response.bodyBytes);
    final result = jsonDecode(body);
    return result;
  } else {
    throw Exception('No s\'ha pogut connectar');
  }
}

Future<List> obtenirComarquesAmbImatge(String provincia) async {
  String url =
      "https://node-comarques-rest-server-production.up.railway.app/api/comarques/comarquesAmbImatge/$provincia";
  http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == HttpStatus.ok) {
    String body = utf8.decode(response.bodyBytes);
    final result = jsonDecode(body);
    return result;
  } else {
    throw Exception('No s\'ha pogut connectar');
  }
}

Future<dynamic> obtenirInfoComarca(String comarca) async {
  try {
    String url = "https://node-comarques-rest-server-production.up.railway.app/api/comarques/infoComarca/${Uri.encodeComponent(comarca)}";
    print("Intentando conectar a: $url");

    final response = await http.get(Uri.parse(url));

    print("Código de respuesta: ${response.statusCode}");

    if (response.statusCode == HttpStatus.ok) {
      String body = utf8.decode(response.bodyBytes);
      print("Respuesta recibida: $body");
      return jsonDecode(body);
    } else {
      print("Error HTTP: ${response.statusCode} - ${response.reasonPhrase}");
      throw Exception('Error HTTP: ${response.statusCode}');
    }
  } catch (e) {
    print("Error de conexión: $e");
    throw Exception('No s’ha pogut connectar: $e');
  }
}



