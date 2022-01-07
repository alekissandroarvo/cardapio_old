import 'package:flutter/material.dart';
import '../models/produtoclass.dart';

class AddProdutos extends StatelessWidget {
  AddProdutos({Key? key}) : super(key: key);

  final TextEditingController imagecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();
  final TextEditingController typecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final Produto addprodutos = Produto();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Center(
            child: Card(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Login',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Image',
                            icon: Icon(Icons.email),
                            hintText:
                                "http://localdaminhaimagem.com/imagem.jpg",
                          ),
                          controller: imagecontroller,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Por favor entrar com link da imagem';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Descrição do Produto',
                            icon: Icon(Icons.lock),
                            hintText: "Picanha grelhada",
                          ),
                          controller: descriptioncontroller,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Por favor entrar com descrição sintetizada do prato';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Preço do Produto',
                            icon: Icon(Icons.lock),
                            hintText: "35.78",
                          ),
                          controller: descriptioncontroller,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Por favor entrar com preço do produto';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Tipo do produto',
                            icon: Icon(Icons.lock),
                            hintText: "Prato, sobremesa, bebida",
                          ),
                          controller: descriptioncontroller,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Por favor entrar com o tipo do serviço';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            child: const Text('Login'),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                addprodutos.image = imagecontroller.text;
                                addprodutos.description =
                                    descriptioncontroller.text;
                                addprodutos.price = pricecontroller.text;
                                addprodutos.type = typecontroller.text;
                                addprodutos.addProduto();
                              }
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
