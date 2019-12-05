import 'package:petvac/app/pages/funcionarios/funcionarios_repository.dart';
import 'package:petvac/app/pages/funcionarios/funcionarios_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class FuncionariosModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => FuncionariosBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => FuncionariosRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<FuncionariosModule>.of();
}
