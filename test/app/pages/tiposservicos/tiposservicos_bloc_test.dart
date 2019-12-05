import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:petvac/app/pages/tiposservicos/tiposservicos_bloc.dart';
import 'package:petvac/app/pages/tiposservicos/tiposservicos_module.dart';

void main() {
  initModule(TiposservicosModule());
TiposServicosBloc bloc;

  setUp(() {
    bloc = TiposservicosModule.to.bloc<TiposServicosBloc>();
  });

  group('TiposservicosBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<TiposServicosBloc>());
    });
  });
}
