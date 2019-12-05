import 'package:petvac/app/pages/tiposservicos/tiposservicos_repository.dart';
import 'package:petvac/app/pages/tiposservicos/tiposservicos_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class TiposservicosModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => TiposServicosBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => TiposServicosRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<TiposservicosModule>.of();
}
