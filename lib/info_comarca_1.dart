import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'peticions_http.dart';

class InfoComarca1Screen extends StatefulWidget {
  final String provincia;
  final String comarca;
  const InfoComarca1Screen({super.key, required this.provincia, required this.comarca});

  @override
  _InfoComarca1ScreenState createState() => _InfoComarca1ScreenState();
}

class _InfoComarca1ScreenState extends State<InfoComarca1Screen> {
  late Future<dynamic> comarcaFuture;

  @override
  void initState() {
    super.initState();
    print(widget.comarca);
    comarcaFuture = obtenirInfoComarca(widget.comarca);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Informació de la Comarca')),
      body: FutureBuilder<dynamic>(
        future: comarcaFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No s’ha trobat informació.'));
          }

          var comarca = snapshot.data;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  comarca["img"],
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comarca["comarca"],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Capital: ${comarca["capital"]}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        comarca["desc"],
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            context.push('/infoComarca2/${widget.provincia}/${widget.comarca}');
                          },
                          child: const Text('Ver Más Información'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
