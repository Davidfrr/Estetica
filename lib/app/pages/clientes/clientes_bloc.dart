import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:petvac/models/clientes_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';
import 'clientes_repository.dart';

class ClientesBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<ClientesRepository>();
  get clientes => _repository.clientes;

  String _documentId;
  DateTime _data_nascimento;
  String _nome;
  String _tiposservicos_id;
  String _sexo;
  String _user_id;

   ClientesBloc() {
    _dataNascimentoController.listen((value) => _data_nascimento = value);
    _nomeController.listen((value) => _nome = value);
    _tiposServicosIdController.listen((value) => _tiposservicos_id = value);
    _sexoController.listen((value) => _sexo = value);
    _userIdController.listen((value) => _user_id = value);
  }

  void setClientes(Clientes clientes) {
    _documentId = clientes.documentId();
    setNome(clientes.nome);
    setDataNascimento(clientes.data_nascimento);
    setTiposServicosId(clientes.tiposservicos_id);
    setSexo(clientes.sexo);
    setUserId(clientes.user_id);
  }

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream;
  void setNome(String valor) => _nomeController.sink.add(valor);

  var _dataNascimentoController = BehaviorSubject<DateTime>();
  Stream<DateTime> get outDataNascimento => _dataNascimentoController.stream;
  void setDataNascimento(DateTime valor) =>
      _dataNascimentoController.sink.add(valor);

  var _tiposServicosIdController = BehaviorSubject<String>();
  Stream<String> get outTiposServicosId => _tiposServicosIdController.stream;
  String get outTiposServicosIdValue => _tiposServicosIdController.stream.value;
  void setTiposServicosId(String valor) => _tiposServicosIdController.sink.add(valor);

  var _sexoController = BehaviorSubject<String>();
  Stream<String> get outSexo => _sexoController.stream;
  String get outSexoValue => _sexoController.stream.value;
  void setSexo(String valor) => _sexoController.sink.add(valor);

  var _userIdController = BehaviorSubject<String>();
  Stream<String> get userId => _userIdController.stream;
  void setUserId(String valor) => _userIdController.sink.add(valor);

  bool insertOrUpdate() { 
    var clientes = Clientes()
      ..data_nascimento = _data_nascimento
      ..nome = _nome
      ..tiposservicos_id = _tiposservicos_id
      ..sexo = _sexo
      ..user_id = _user_id;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(clientes);
    } else {
      _repository.update(_documentId, clientes);
    }

    return true;
  }

  void delete(String documentId) => _repository.delete(documentId);

  @override
  void dispose() {
    _dataNascimentoController.close();
    _nomeController.close();
    _tiposServicosIdController.close();
    _sexoController.close();
    _userIdController.close();
    super.dispose();
  }
}


