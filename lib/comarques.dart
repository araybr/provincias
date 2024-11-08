import 'package:flutter/material.dart';
import 'counties.dart';

class ComarquesScreen extends StatelessWidget {
  const ComarquesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> comarques = provincies["provincies"][0]["comarques"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Comarques de València"),
      ),
      body: ListView.builder(
        itemCount: comarques.length,
        itemBuilder: (context, index) {
          var comarca = comarques[index];
          return Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    comarca["img"],
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    comarca["comarca"],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}