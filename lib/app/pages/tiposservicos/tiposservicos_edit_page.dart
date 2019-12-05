import 'package:flutter/material.dart';
import 'package:petvac/models/tiposservicos_model.dart';

import 'tiposservicos_bloc.dart';

class TiposServicosEditPage extends StatefulWidget {
  TiposServicosEditPage(this.tiposservicos);

  final TiposServicos tiposservicos;

  @override
  _TiposServicosEditPageState createState() => _TiposServicosEditPageState();
}

class _TiposServicosEditPageState extends State<TiposServicosEditPage> {
  TextEditingController _nomeController;
  final _bloc = TiposServicosBloc();

  @override
  void initState() {
    var bloc = _bloc;
    bloc.setTiposservicos(widget.tiposservicos);
    _nomeController = TextEditingController(text: widget.tiposservicos.nome);
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
