import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petvac/app/pages/tiposservicos/tiposservicos_bloc.dart';
import 'package:petvac/models/clientes_model.dart';
import 'package:petvac/models/tiposservicos_model.dart';
import 'package:rxdart/rxdart.dart';

import 'clientes_bloc.dart';

class ClientesEditPage extends StatefulWidget {
  ClientesEditPage(this.clientes);

  final Clientes clientes;

  @override
  _ClientesEditPageState createState() => _ClientesEditPageState();
}

class _ClientesEditPageState extends State<ClientesEditPage> {
  TextEditingController _nomeController;
  final _bloc = ClientesBloc();
  final _blocTiposServicos = TiposServicosBloc();
  final _dateFormat = DateFormat("dd/MM/yyyy");
  TiposServicos _tiposservicos = new TiposServicos();

  @override
  void initState() {
    var bloc = _bloc;
    bloc.setClientes(widget.clientes);
    _nomeController = TextEditingController(text: widget.clientes.nome);
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
              Container(height: 20),
              StreamBuilder<DateTime>(
                stream: _bloc.outDataNascimento,
                initialData: DateTime.now(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();

                  return InkWell(
                    onTap: () => _selectDataNascimento(context, snapshot.data),
                    child: InputDecorator(
                      decoration:
                          InputDecoration(labelText: "Data de Nascimento"),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(_dateFormat.format(snapshot.data)),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Container(height: 20),
              Container(
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: "Deseja ",
                  ),
                  child: StreamBuilder<List<TiposServicos>>(
                    stream: _blocTiposServicos.tiposservicos,
                    builder: (context, snapshotTiposServicos) {
                      var _tiposServicosId = _bloc.outTiposServicosIdValue;

                      return snapshotTiposServicos.hasData
                          ? DropdownButton<String>(
                              value: _tiposServicosId,
                              isExpanded: true,
                              items: snapshotTiposServicos.data
                                  .map<DropdownMenuItem<String>>(
                                      (TiposServicos tiposservicos) {
                                return DropdownMenuItem<String>(
                                  value: tiposservicos.documentId(),
                                  child: Text(tiposservicos.nome),
                                );
                              }).toList(),
                              onChanged: (String tiposServicosId) {
                                _tiposServicosId = tiposServicosId;
                                _bloc.setTiposServicosId(tiposServicosId);
                              },
                            )
                          : CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              Container(height: 20),
              Container(
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: "Sexo",
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: const Text('Masculino'),
                        leading: Radio(
                          value: 'M',
                          groupValue: _bloc.outSexoValue,
                          onChanged: (value) {
                            setState(() {
                              _bloc.setSexo(value);
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Femino'),
                        leading: Radio(
                          value: 'F',
                          groupValue: _bloc.outSexoValue,
                          onChanged: (value) {
                            setState(() {
                              _bloc.setSexo(value);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
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

  Future _selectDataNascimento(
      BuildContext context, DateTime initialDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null) {
      _bloc.setDataNascimento(picked);
    }
  }
}


