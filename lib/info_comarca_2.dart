import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'counties.dart';
import './peticions_http.dart';

class InfoComarca2Screen extends StatefulWidget {
  final String provincia;
  final String comarca_env;

  const InfoComarca2Screen({
    super.key,
    required this.provincia,
    required this.comarca_env,
  });

  @override
  State<InfoComarca2Screen> createState() =>
      _InfoComarca2Screen(provincia, comarca_env);
}

class _InfoComarca2Screen extends State<InfoComarca2Screen> {
  late final provincia;
  late Future<dynamic> info;
  late final comarca_env;
  late final comarca;

  _InfoComarca2Screen(this.provincia, this.comarca_env) {
    comarca = provincies["provincies"][int.parse(provincia)]["comarques"]
        [int.parse(comarca_env)];
  }

  @override
  void initState() {
    super.initState();
    info = obteClima(
      longitud: comarca["coordenades"][0] ?? 0.0,
      latitud: comarca["coordenades"][1] ?? 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Información de ${comarca["comarca"]}"),
      ),
      body: FutureBuilder(
        future: info,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error al cargar datos"));
          } else if (snapshot.hasData) {
            final String temperatura =
                snapshot.data["current_weather"]["temperature"].toString();
            final String velVent =
                snapshot.data["current_weather"]["windspeed"].toString();
            final String direccioVent =
                snapshot.data["current_weather"]["winddirection"].toString();
            final String codi =
                snapshot.data["current_weather"]["weathercode"].toString();

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _obtenirIconaOratge(codi),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.thermostat, size: 30),
                        const SizedBox(width: 8),
                        Text(
                          "$temperaturaº",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.wind_power, size: 30),
                        const SizedBox(width: 8),
                        Text(
                          "${velVent} km/h",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(width: 8),
                        _obteGinyDireccioVent(double.parse(direccioVent)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow("Población:", comarca["poblacio"].toString()),
                    _buildInfoRow(
                        "Latitud:", comarca["coordenades"][0].toString()),
                    _buildInfoRow(
                        "Altitud:", comarca["coordenades"][1].toString()),
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

  Widget _obteGinyDireccioVent(double direccioVent) {
    late Icon icona;
    late String nomVent;

    if (direccioVent > 22.5 && direccioVent <= 67.5) {
      icona = const Icon(Icons.north_east);
      nomVent = "Gregal";
    } else if (direccioVent > 67.5 && direccioVent <= 112.5) {
      icona = const Icon(Icons.east);
      nomVent = "Llevant";
    } else if (direccioVent > 112.5 && direccioVent <= 157.5) {
      icona = const Icon(Icons.south_east);
      nomVent = "Xaloc";
    } else if (direccioVent > 157.5 && direccioVent <= 202.5) {
      icona = const Icon(Icons.south);
      nomVent = "Migjorn";
    } else if (direccioVent > 202.5 && direccioVent <= 247.5) {
      icona = const Icon(Icons.south_west);
      nomVent = "Llebeig/Garbí";
    } else if (direccioVent > 247.5 && direccioVent <= 292.5) {
      icona = const Icon(Icons.west);
      nomVent = "Ponent";
    } else if (direccioVent > 292.5 && direccioVent <= 337.5) {
      icona = const Icon(Icons.north_west);
      nomVent = "Mestral";
    } else {
      icona = const Icon(Icons.north);
      nomVent = "Tramuntana";
    }
    return Row(children: [
      Text(nomVent),
      icona,
    ]);
  }

  Widget _obtenirIconaOratge(String value) {
    final Set<String> sol = {"0"};
    final Set<String> pocsNuvols = {"1", "2", "3"};
    final Set<String> nuvols = {"45", "48"};
    final Set<String> plujasuau = {"51", "53", "55"};
    final Set<String> pluja = {
      "61",
      "63",
      "65",
      "66",
      "67",
      "80",
      "81",
      "82",
      "95",
      "96",
      "99"
    };
    final Set<String> neu = {"71", "73", "75", "77", "85", "86"};

    if (sol.contains(value)) {
      return Image.asset("assets/icons/png/soleado.png", height: 50);
    }
    if (pocsNuvols.contains(value)) {
      return Image.asset("assets/icons/png/poco_nublado.png", height: 50);
    }
    if (nuvols.contains(value)) {
      return Image.asset("assets/icons/png/nublado.png", height: 50);
    }
    if (plujasuau.contains(value)) {
      return Image.asset("assets/icons/png/lluvia_debil.png", height: 50);
    }
    if (pluja.contains(value)) {
      return Image.asset("assets/icons/png/lluvia.png", height: 50);
    }
    if (neu.contains(value)) {
      return Image.asset("assets/icons/png/nieve.png", height: 50);
    }
    return Image.asset("assets/icons/png/poco_nublado.png", height: 50);
  }
}
