import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'counties.dart';

class InfoComarca1Screen extends StatelessWidget {
  const InfoComarca1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var comarca = provincies["provincies"][0]["comarques"][0];

    return Scaffold(
        appBar: AppBar(title: const Text('Provincia')),
        body: Column(
          children: [
            Image.network(
              comarca[
                  "img"], // Asegúrate de que la imagen esté en la carpeta assets y esté correctamente referenciada en pubspec.yaml
              width: double.infinity,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0), // Añade espacio en el lado izquierdo
                  child: Text(
                    comarca["comarca"],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Capital: " + comarca["capital"],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    comarca["desc"],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                )),
            const SizedBox(height: 280),

              ElevatedButton(
                onPressed: () {
                  context.push('/infoComarca2');
                }, 
                child: const Text('Ver Más Información'),
              )

          ],
        ));
  }
}
