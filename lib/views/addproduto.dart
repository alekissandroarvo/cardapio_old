import 'package:flutter/material.dart';
import '../models/produtoclass.dart';

class AddProduto extends StatelessWidget {
  AddProduto({Key? key}) : super(key: key);

  final TextEditingController imagecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();
  final TextEditingController typecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Produto addproduto = Produto();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio'),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'URL Imagem',
                      icon: Icon(Icons.email),
                      hintText: "http://minhaimagem.com.br/imagem.jpg",
                    ),
                    controller: imagecontroller,
                    validator: (link) {
                      if (link == null || link.isEmpty) {
                        return 'Por favor entrar com URL da imagem';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Descrição prato, sobremesa, bebida',
                      icon: Icon(Icons.email),
                      hintText: "Picanha grelhada",
                    ),
                    controller: descriptioncontroller,
                    validator: (prato) {
                      if (prato == null || prato.isEmpty) {
                        return 'Por favor entrar com a descrição do prato, sobremesa, bebida';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Preço',
                      icon: Icon(Icons.email),
                      hintText: "35.00",
                    ),
                    controller: descriptioncontroller,
                    validator: (preco) {
                      if (preco == null || preco.isEmpty) {
                        return 'Por favor entrar com a descrição do prato, sobremesa, bebida';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Tipo do prato',
                      icon: Icon(Icons.email),
                      hintText: "Prato, sobremesa, bebida",
                    ),
                    controller: typecontroller,
                    validator: (preco) {
                      if (preco == null || preco.isEmpty) {
                        return 'Por favor entrar com o tipo do prato: prato, sobremesa, bebida';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addproduto.image = imagecontroller.text;
                        addproduto.description = descriptioncontroller.text;
                        addproduto.price = pricecontroller.text;
                        addproduto.type = typecontroller.text;
                        addproduto.addProduto();
                      }
                    },
                    child: Text('Add Produto'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
