import 'package:alekissandroarvo/models/pedidoclass.dart';
import 'package:alekissandroarvo/models/produtoclass.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:alekissandroarvo/views/drawer.dart';
import 'package:flutter/material.dart';
import 'produto.dart';

class Colaborador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController mesacontroller = TextEditingController();
    final TextEditingController quantidadecontroller = TextEditingController();
    Produto obj = Produto();
    Pedido obj2 = Pedido();
    CollectionReference produtos =
        FirebaseFirestore.instance.collection('produtos');
    return FutureBuilder<DocumentSnapshot>(
      future: produtos.doc().get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Cardápio'),
            ),
            body: Center(
              child: Text("Something went wrong"),
            ),
          );
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Cardápio'),
            ),
            body: Center(
              child: Text("Document does not exist"),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            appBar: AppBar(
              title: Text('Cardápio'),
            ),
            body: ListView(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Número da mesa',
                      icon: Icon(Icons.email),
                      hintText: "01,02,03...",
                    ),
                    controller: mesacontroller,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Por favor entrar número da mesa';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    obj.description = data['description'];
                    obj.image = data['image'];
                    obj.price = data['price'];
                    obj.type = data['type'];
                    obj2.table = mesacontroller.text;
                    obj2.produto = obj;
                    obj2.horario = DateTime.now().toString();
                    obj2.quantidade = quantidadecontroller.text;
                    obj2.addPedido();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pedido Enviado')),
                    );
                  },
                  child: ProdutoWid(
                    imagemProduto: data['image'],
                    labelProduto: data['description'],
                    price: data['price'],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'quantidade',
                      icon: Icon(Icons.email),
                      hintText: "1,2,3...",
                    ),
                    controller: quantidadecontroller,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Por favor entrar quantidade do pedido';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Cardápio'),
          ),
          body: Center(
            child: Text("loading"),
          ),
        );
      },
    );
  }
}
