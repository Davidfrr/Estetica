import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:petvac/app/pages/funcionarios/funcionarios_bloc.dart';
import 'package:petvac/app/pages/funcionarios/funcionarios_module.dart';

void main() {
  initModule(FuncionariosModule());
  FuncionariosBloc bloc;

  setUp(() {
    bloc = FuncionariosModule.to.bloc<FuncionariosBloc>();
  });

  group('FuncionariosBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<FuncionariosBloc>());
    });
  });
}
