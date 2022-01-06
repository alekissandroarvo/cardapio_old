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
          Container(
            height: 100,
            child: ListTile(
              title: Card(
                child: Text('Cadastrar Usuário'),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SignUp()));
              },
            ),
          ),
          Container(
            height: 100,
            child: ListTile(
              title: Card(
                child: Text('Deletar Usuário'),
              ),
              onTap: () {},
            ),
          ),
          Container(
            height: 100,
            child: ListTile(
              title: Card(
                child: Text('Adicionar produto'),
              ),
              onTap: () {},
            ),
          ),
          Container(
            height: 100,
            child: ListTile(
              title: Card(
                child: Text('Deletar Produto'),
              ),
              onTap: () {},
            ),
          ),
          Container(
            height: 100,
            child: ListTile(
              title: Card(
                child: Text('Editar Produto'),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
