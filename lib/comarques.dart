import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'counties.dart';

class ComarquesScreen extends StatelessWidget {
  final String provincia;
  const ComarquesScreen({super.key, required this.provincia});

  @override
  Widget build(BuildContext context) {
    List<dynamic> comarques = provincies["provincies"][int.parse(provincia)]["comarques"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Comarques"),
      ),
      body: ListView.builder(
        itemCount: comarques.length,
        itemBuilder: (context, index) {
          var comarca = comarques[index];
          return Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                  onTap: () {
                    context.push('/infoComarca1/' + provincia + "/" + index.toString());
                  },
                  child: Padding(
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
                  )),
              Positioned(
                bottom: 20,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
