import 'package:flutter/material.dart';
import 'package:petvac/app/menu/drawer.dart';
import 'package:petvac/models/tiposservicos_model.dart';

import 'tiposservicos_bloc.dart';
import 'tiposservicos_edit_page.dart';

class TiposServicosPage extends StatefulWidget {
  static const String rota = '/tiposservicos';

  final String title;
  const TiposServicosPage({Key key, this.title = "Tiposservicos"}) : super(key: key);

  @override
  _TiposServicosPageState createState() => _TiposServicosPageState();
}

class _TiposServicosPageState extends State<TiposServicosPage> {
  var _bloc = TiposServicosBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var tiposservicos = TiposServicos()..nome = "";

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TiposServicosEditPage(tiposservicos)),
          );
        },
      ),
      drawer: MenuDrawer(),
      body: Container(
        child: StreamBuilder<List<TiposServicos>>(
          stream: _bloc.tiposservicos,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            return Container(
              child: ListView(
                children: snapshot.data.map((tiposservicos) {
                  return Dismissible(
                    key: Key(tiposservicos.documentId()),
                    onDismissed: (direction) {
                      _bloc.delete(tiposservicos.documentId());
                    },
                    child: ListTile(
                      title: Text(tiposservicos.nome),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                    
                              builder: (context) => TiposServicosEditPage(tiposservicos)),
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
