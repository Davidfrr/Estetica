import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:petvac/app/pages/clientes/clientes_bloc.dart';
import 'package:petvac/app/pages/clientes/clientes_module.dart';

void main() {
  initModule(ClientesModule());
  ClientesBloc bloc;

  setUp(() {
    bloc = ClientesModule.to.bloc<ClientesBloc>();
  });

  group('ClientesBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<ClientesBloc>());
    });
  });
}


