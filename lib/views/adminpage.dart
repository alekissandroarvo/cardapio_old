import 'package:alekissandroarvo/views/signup.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('Cadastrar Usuário'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SignUp()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Deletar Usuário'),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Adicionar produto'),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Deletar Produto'),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Editar Produto'),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
