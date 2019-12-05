import 'package:flutter/material.dart';
import 'routes.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.contacts,
              text: 'Home',
              onTap: () => Navigator.pushReplacementNamed(context, Rotas.home)),
          _createDrawerItem(
              icon: Icons.shop,
              text: 'Funcionario',
              onTap: () => Navigator.pushReplacementNamed(context, Rotas.funcionario)),
          _createDrawerItem(
              icon: Icons.shop,
              text: 'Tipo De Servico',
              onTap: () => Navigator.pushReplacementNamed(context, Rotas.tipoServico)),
          _createDrawerItem(
              icon: Icons.shop,
              text: 'Cliente',
              onTap: () => Navigator.pushReplacementNamed(context, Rotas.cliente)),
          Divider(),
          
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/estetica.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Estetica Menu",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
