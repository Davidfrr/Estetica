import 'package:petvac/app/pages/clientes/clientes_repository.dart';
import 'package:petvac/app/pages/clientes/clientes_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class ClientesModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ClientesBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => ClientesRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<ClientesModule>.of();
}


