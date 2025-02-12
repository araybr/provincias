import 'package:flutter_provincias/comarques.dart';
import 'package:flutter_provincias/info_comarca_1.dart';
import 'package:flutter_provincias/info_comarca_2.dart';
import 'package:flutter_provincias/login.dart';
import 'package:flutter_provincias/provinces.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'login',
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      name: 'provincies',
      path: '/provincies',
      builder: (context, state) => const ProvinciasScreen(),
    ),
    GoRoute(
      name: 'comarques',
      path: '/comarques/:provincia',
      builder: (context, state) {
        final String provincia = state.pathParameters['provincia']!;
        return ComarquesScreen(provincia: provincia);
      }
    ),
    GoRoute(
      name: 'info_comarca_1',
      path: '/infoComarca1/:provincia/:comarca',
      builder: (context, state) {
        final String provincia = state.pathParameters['provincia']!;
        final String comarca = state.pathParameters['comarca']!;
        return InfoComarca1Screen(provincia: provincia, comarca: comarca);
      },
    ),
    GoRoute(
      name: 'info_comarca_2',
      path: '/infoComarca2/:provincia/:comarca',
      builder: (context, state) {
        final String provincia = state.pathParameters['provincia']!;
        final String comarca = state.pathParameters['comarca']!;
        return InfoComarca2Screen(provincia: provincia, comarca_env:comarca);
      }
    ),
  ],
);
