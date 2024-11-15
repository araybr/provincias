import 'package:flutter/material.dart';
import 'counties.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoComarca2Screen extends StatelessWidget {
  const InfoComarca2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var comarca = provincies["provincies"][0]["comarques"][0];

    return Container(
        child: Column(
      children: [
        const Text(
          "La Safor",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Galada'),
        ),
        Image.asset(
          'assets/lluvia.png',
          width: double.infinity,
        ),
        const SizedBox(height: 24),
        Center(
          child: const Row(
            mainAxisAlignment:
                MainAxisAlignment.center, 
            children: [
              const Icon(FontAwesomeIcons.thermometer, size: 30.0),
              Text(
                "6.3º",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.fan, size: 30.0),
              Text(
                "   9.4km/h      Ponent <--",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
         SizedBox(height: 10.0),
        Row(
            children: [
              SizedBox(width: 30.0),
              Text(
                "Població:",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 70.0),
              Text(
                "163.000",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 30.0),
              Text(
                "Latitud:",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 70.0),
              Text(
                "38.77234678",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 30.0),
              Text(
                "Longitud:",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 70.0),
              Text(
                "-0.123143709",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
      ],
    ));
  }
}
