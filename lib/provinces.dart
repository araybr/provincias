import 'package:flutter/material.dart';
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
              buildCityContainer(
                  provincies["provincies"][2]["img"], 'Castelló', context, 2),
              SizedBox(height: 20),
              buildCityContainer(
                  provincies["provincies"][0]["img"], 'Valencia', context, 0),
              SizedBox(height: 20),
              buildCityContainer(provincies["provincies"][1]["img"], 'Alacant', context, 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCityContainer(String imagePath, String cityName, BuildContext context, int numero) {
    return InkWell(
        onTap: () {
          context.push('/comarques/' + numero.toString());
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
