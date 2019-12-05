import 'package:flutter/material.dart';
import 'package:petvac/app/pages/funcionarios/funcionarios_bloc.dart';
import 'package:petvac/models/funcionarios_model.dart';

class FuncionariosEditPage extends StatefulWidget {
  FuncionariosEditPage(this.funcionario);

  final Funcionario funcionario;

  @override
  _FuncionariosEditPageState createState() => _FuncionariosEditPageState();
}

class _FuncionariosEditPageState extends State<FuncionariosEditPage> {
  TextEditingController _nomeController;
  final _bloc = FuncionariosBloc();

  @override
  void initState() {
    _bloc.setFuncionario(widget.funcionario);
    _nomeController = TextEditingController(text: widget.funcionario.nome);
    super.initState();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estetica"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Nome"),
                  controller: _nomeController,
                  onChanged: _bloc.setNome,
                ),
              ),
              RaisedButton(
                  child: Text("Salvar"),
                  onPressed: () {
                    if (_bloc.insertOrUpdate()) {
                      Navigator.pop(context);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
