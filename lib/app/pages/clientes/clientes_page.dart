import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petvac/app/menu/drawer.dart';
import 'package:petvac/models/clientes_model.dart';

import 'clientes_bloc.dart';
import 'clientes_edit_page.dart';

class ClientesPage extends StatefulWidget {
  static const String rota = '/clientes';

  final String title;
  const ClientesPage({Key key, this.title = "Clientes"}) : super(key: key);

  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  var _bloc = ClientesBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var clientes = Clientes()
            ..data_nascimento = DateTime.now()
            ..nome = ""
            ..tiposservicos_id = ""
            ..sexo = ""
            ..user_id = "";

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ClientesEditPage(clientes)),
            //ClientesEditPage(pettipos)),
          );
        },
      ),
      body: Container(
        child: StreamBuilder<List<Clientes>>(
          stream: _bloc.clientes,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            return Container(
              child: ListView(
                children: snapshot.data.map((clientes) {
                  return Dismissible(
                    key: Key(clientes.documentId()),
                    onDismissed: (direction) {
                      _bloc.delete(clientes.documentId());
                    },
                    child: ListTile(
                      title: Text(clientes.nome),
                      //subtitle: Text(pettipos.data_nascimento.toString()),
                      subtitle: Text(new DateFormat("dd-MM-yyyy")
                          .format(clientes.data_nascimento)),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClientesEditPage(clientes)),
                          //ClientesEditPage(pettipos)),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}


