import 'package:flutter/material.dart';
import 'package:flutter_provincias/peticions_http.dart';
import 'counties.dart';
import 'package:go_router/go_router.dart';

class ProvinciasScreen extends StatelessWidget {
  const ProvinciasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                  future: obtenirProvincies(),
                  builder: (context, snapshot) {
                    List<dynamic>? data = snapshot.data;
                    if (data != null) {
                      return Column(
                          children: data.map((provincia) {
                            return buildCityContainer(
                              provincia["img"],
                              provincia["provincia"],
                              context,
                              provincia["provincia"]
                            );
                          }).toList()
                        );
                    } else {
                      return Text("Error");
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCityContainer(
      String imagePath, String cityName, BuildContext context, String numero) {
    return InkWell(
        onTap: () {
          context.push('/comarques/' + numero);
        },
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              cityName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
