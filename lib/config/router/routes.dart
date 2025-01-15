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
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: 'provincies',
      path: '/provincies',
      builder: (context, state) => const ProvinciasScreen(),
    ),
    GoRoute(
      name: 'comarques',
      path: '/comarques',
      builder: (context, state) => const ComarquesScreen(),
    ),
    GoRoute(
      name: 'info_comarca_1',
      path: '/infoComarca1',
      builder: (context, state) => const InfoComarca1Screen(),
    ),
    GoRoute(
      name: 'info_comarca_2',
      path: '/infoComarca2',
      builder: (context, state) => const InfoComarca2Screen(),
    ),
  ],
);
