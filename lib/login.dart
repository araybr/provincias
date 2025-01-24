import 'package:flutter/material.dart';
import 'package:flutter_provincias/config/router/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_provincias/login1.dart';
import 'package:flutter_provincias/register.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provincias"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Iniciar Sesión"),
            Tab(text: "Registrarse"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          LoginTab(),
          RegisterTab(),
        ],
      ),
    );
  }
}
