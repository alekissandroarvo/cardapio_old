import 'package:alekissandroarvo/models/usuario.dart';
import 'package:alekissandroarvo/views/colaborador.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:english_words/english_words.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController senhacontroller = TextEditingController();
  final TextEditingController confirmationText = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final String? textoconfirmacao = WordPair.random(maxSyllables: 3).toString();

  Usuario user = Usuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cardápio"),
      ),
      body: ListView(children: <Widget>[
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
                          labelText: 'Email',
                          icon: Icon(Icons.email),
                          hintText: "Email",
                        ),
                        controller: emailcontroller,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Por favor entrar email válido';
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
                          labelText: 'Senha',
                          icon: Icon(Icons.lock),
                          hintText: "Senha",
                        ),
                        controller: senhacontroller,
                        validator: (senha) {
                          if (senha == null || senha.isEmpty) {
                            return 'Por favor entrar com senha válida';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Texto de confirmação ${textoconfirmacao!}"),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Texto de confirmação',
                          icon: Icon(Icons.lock),
                          hintText: "Texto de confirmação",
                        ),
                        controller: confirmationText,
                        validator: (confirmation) {
                          if (confirmationText.text != textoconfirmacao) {
                            return 'Texto de confirmação incorreto';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            user.email = emailcontroller.text;
                            user.senha = senhacontroller.text;
                            user.nome = emailcontroller.text;

                            try {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                      email: "${user.email}",
                                      password: "${user.senha}");
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Conectado')),
                              );
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Colaborador()));
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Usuário não cadastrado')),
                                );
                              } else if (e.code == 'wrong-password') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Senha Incorreta')),
                                );
                              }
                            }
                          }
                        },
                        child: const Text('Login'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
