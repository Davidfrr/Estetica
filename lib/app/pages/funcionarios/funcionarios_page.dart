import 'package:flutter/material.dart';
import 'package:petvac/app/menu/drawer.dart';
import 'package:petvac/models/funcionarios_model.dart';

import 'funcionarios_bloc.dart';
import 'funcionarios_edit_page.dart';

class FuncionarioPage extends StatefulWidget {
  final String title;
  static const String rota = '/funcionario';

  const FuncionarioPage({Key key, this.title = "Funcionarios"}) : super(key: key);

  @override
  _FuncionariosPageState createState() => _FuncionariosPageState();
}

class _FuncionariosPageState extends State<FuncionarioPage> {
  var _bloc = FuncionariosBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            var funcionarios = Funcionario()..nome = "";

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FuncionariosEditPage(funcionarios)),
            );
          },
        ),
        drawer: MenuDrawer(),
        body: Container(
            child: StreamBuilder<List<Funcionario>>(
                stream: _bloc.Funcionarios,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();

                  return Container(
                    child: ListView(
                      children: snapshot.data.map((funcionarios) {
                        return Dismissible(
                            key: Key(funcionarios.documentId()),
                            onDismissed: (direction) {
                              _bloc.delete(funcionarios.documentId());
                            },
                            child: ListTile(
                              title: Text(funcionarios.nome),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FuncionariosEditPage(funcionarios)),
                                );
                              },
                            ));
                      }).toList(),
                    ),
                  );
                })));
  }
}
