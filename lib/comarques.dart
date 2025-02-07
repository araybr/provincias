import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'peticions_http.dart';

class ComarquesScreen extends StatefulWidget {
  final String provincia;
  const ComarquesScreen({super.key, required this.provincia});

  @override
  _ComarquesScreenState createState() => _ComarquesScreenState();
}

class _ComarquesScreenState extends State<ComarquesScreen> {
  late Future<List<dynamic>> comarquesFuture;

  @override
  void initState() {
    super.initState();
    comarquesFuture = obtenirComarques(widget.provincia);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comarques"),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: comarquesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hi ha comarques disponibles.'));
          }

          List<dynamic> comarques = snapshot.data!;
          return ListView.builder(
            itemCount: comarques.length,
            itemBuilder: (context, index) {
              var comarca = comarques[index];
              return Stack(
                alignment: Alignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.push('/infoComarca1/${widget.provincia}/' + index.toString());
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
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      color: Colors.black54,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        comarca["nom"],
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
          );
        },
      ),
    );
  }
}
