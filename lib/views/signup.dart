import 'package:alekissandroarvo/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:english_words/english_words.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController nomecontroller = TextEditingController();
  final TextEditingController senhacontroller = TextEditingController();
  final TextEditingController senhaconfcontroller = TextEditingController();
  final TextEditingController confirmationText = TextEditingController();

  final String? textoconfirmacao = WordPair.random(maxSyllables: 3).toString();

  final _formKey = GlobalKey<FormState>();

  Usuario user = Usuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Ship Race"),
      ),
      body: Center(
        child: ListView(children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Card(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Cadastro de Cliente',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Nome completo',
                        icon: Icon(Icons.person),
                        hintText: "Nome de usuário",
                      ),
                      controller: nomecontroller,
                      validator: (nome) {
                        if (nome == null || nome.isEmpty) {
                          return 'Por favor entrar com nome de usuário';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
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
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirmar senha',
                        icon: Icon(Icons.lock),
                        hintText: "Confirmar senha",
                      ),
                      controller: senhaconfcontroller,
                      validator: (senhaconf) {
                        if (senhaconfcontroller.text != senhacontroller.text) {
                          return 'As senhas não são iguais';
                        }
                        if (senhaconf!.isEmpty || senhaconf == null) {
                          return 'Favor confirme a senha.';
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
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          user.nome = nomecontroller.text;
                          user.email = emailcontroller.text;
                          user.senha = senhaconfcontroller.text;

                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                                    email: "${user.email}",
                                    password: "${user.senha}");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Cadastrado')),
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Senha Fraca')),
                              );
                            } else if (e.code == 'email-already-in-use') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Email já cadastrado')),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Não realizado cadastro')),
                            );
                          }
                        }
                      },
                      child: const Text('Cadastrar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
