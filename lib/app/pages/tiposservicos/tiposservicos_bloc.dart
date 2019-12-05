import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:petvac/models/tiposservicos_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';
import 'tiposservicos_repository.dart';

class TiposServicosBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<TiposServicosRepository>();
  Observable<List<TiposServicos>> get tiposservicos => _repository.tiposservicos;

  Future<List<TiposServicos>> listtiposservicos() async {
    List<TiposServicos> tiposServicos = new List<TiposServicos>();

    _repository.tiposservicos.forEach((List<TiposServicos> _tiposservicos) {
      tiposServicos.addAll(_tiposservicos);
    });

    return tiposServicos;
  }

  // VacinasEdit
  String _documentId;
  String _nome;

  TiposServicosBloc() {
    _nomeController.listen((value) => _nome = value);
  }

  void setTiposservicos(TiposServicos tiposservicos) {
    _documentId = tiposservicos.documentId();
    setNome(tiposservicos.nome);
  }

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream;

  void setNome(String valor) => _nomeController.sink.add(valor);

  bool insertOrUpdate() {
    var tiposservicos = TiposServicos()..nome = _nome;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(tiposservicos);
    } else {
      _repository.update(_documentId, tiposservicos);
    }

    return true;
  }

  void delete(String documentId) => _repository.delete(documentId);
  
  @override
  void dispose() {
    super.dispose();
  }
}
