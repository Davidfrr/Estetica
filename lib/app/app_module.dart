import 'package:petvac/app/app_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:petvac/app/app_widget.dart';
import 'package:petvac/app/pages/tiposservicos/tiposservicos_repository.dart';
import 'package:petvac/app/pages/funcionarios/funcionarios_repository.dart';

import 'pages/clientes/clientes_repository.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => FuncionariosRepository()),
    Dependency((i) => ClientesRepository()),
    Dependency((i) => TiposServicosRepository()),
  ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}


