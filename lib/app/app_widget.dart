import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petvac/app/menu/routes.dart';
import 'package:petvac/app/pages/home/home_module.dart';
import 'package:petvac/app/pages/home/home_page.dart';
import 'package:petvac/app/pages/clientes/clientes_page.dart';
import 'package:petvac/app/pages/tiposservicos/tiposservicos_page.dart';
import 'package:petvac/app/pages/funcionarios/funcionarios_page.dart';
import 'package:petvac/models/tiposservicos_model.dart';
import 'pages/login/signin_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Rotas.home: (context) => HomePage(),
        Rotas.funcionario: (context) => FuncionarioPage(),
        Rotas.signin:(context) => SignInPage(),
        Rotas.cliente:(context) => ClientesPage(),
        Rotas.tipoServico:(context) => TiposServicosPage(),
      },
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            FirebaseUser user = snapshot.data;
            if (user == null) {
              return SignInPage();
            }
            return HomeModule();
          } else {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}


