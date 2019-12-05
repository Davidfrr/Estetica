import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:petvac/models/funcionarios_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../app_module.dart';
import 'funcionarios_repository.dart';

class FuncionariosBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<FuncionariosRepository>();
  get Funcionarios => _repository.funcionarios;

  // VacinasEdit
  String _documentId;
  String _nome;  

  FuncionariosBloc() {
    _nomeController.listen((value) => _nome = value);
  }

  void setFuncionario(Funcionario funcionario) {
    _documentId = funcionario.documentId();
    setNome(funcionario.nome);
  }

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream;

  void setNome(String valor) => _nomeController.sink.add(valor);

  bool insertOrUpdate() {
    var funcionario = Funcionario()
      ..nome = _nome;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(funcionario);
    } else {
      _repository.update(_documentId, funcionario);
    }

    return true;
  }

  void delete(String documentId) => _repository.delete(documentId);

  @override
  void dispose() {
    _nomeController.close();
    super.dispose();
  }
}
