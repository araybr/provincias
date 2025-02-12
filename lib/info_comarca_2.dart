import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'peticions_http.dart';

class InfoComarca2Screen extends StatefulWidget {
  final String provincia;
  final String comarca_env;

  const InfoComarca2Screen({
    super.key,
    required this.provincia,
    required this.comarca_env,
  });

  @override
  State<InfoComarca2Screen> createState() => _InfoComarca2ScreenState();
}

class _InfoComarca2ScreenState extends State<InfoComarca2Screen> {
  late Future<dynamic> comarcaFuture;

  @override
  void initState() {
    super.initState();
    comarcaFuture = obtenirInfoComarca(widget.comarca_env);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Información de ${widget.comarca_env}"),
      ),
      body: FutureBuilder(
        future: comarcaFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error al cargar datos"));
          } else if (snapshot.hasData) {
            var comarca = snapshot.data;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      comarca["img"],
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      comarca["comarca"],
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow("Capital:", comarca["capital"]),
                    _buildInfoRow("Población:", comarca["poblacio"]),
                    _buildInfoRow("Latitud:", comarca["latitud"].toString()),
                    _buildInfoRow("Longitud:", comarca["longitud"].toString()),
                    const SizedBox(height: 16),
                    Text(comarca["desc"]),
                  ],
                ),
              ),
            );
          }
          return const Center(child: Text("Sin datos disponibles"));
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
