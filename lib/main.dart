import 'package:flutter/material.dart';
import 'views/produto.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Cardapio',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(title: 'Cardápio'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(title),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 10),
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            'Produtos',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Produto(
                  imagemProduto: "https://www.saborbrasil.it/wp-content/uploads/2021/06/Churrasco-de-picanha_sito.jpg",
                  labelProduto: 'Picanha Grelhada',
                  price: '35,00',
                ),
                Produto(
                  imagemProduto: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNNx6QUULaCimmgZZDD7jbIHLIHi94g56_ug&usqp=CAU",
                  labelProduto: 'Peixe Frito',
                  price: '25,00',
                ),
                Produto(
                  imagemProduto: "https://static.baratocoletivo.com.br/2018/0508/oferta_15258061216941_OFERTA_CAMARAO.jpg",
                  labelProduto: 'Camarão à Moda da Casa',
                  price: '30,00',
                ),
                Produto(
                  imagemProduto: "https://www.infoescola.com/wp-content/uploads/2021/10/lagosta-4952603_1920.jpg",
                  labelProduto: 'Lagosta ao Chefe',
                  price: '38,00',
                ),
                Produto(
                  imagemProduto: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZWtYr_h57SjYnlAWGfXuYUDG2Ae7MWF-6pA&usqp=CAU",
                  labelProduto: 'Frango à Parmegiana',
                  price: '25,00',
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Bebidas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Produto(
                  imagemProduto: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIa3diwLLOjCQBUjZsqYcQ65fTBPflikCzlA&usqp=CAU",
                  labelProduto: 'Suco de Laranja',
                  price: '10,00',
                ),
                Produto(
                  imagemProduto: 'https://static.distribuidoracaue.com.br/media/catalog/product/cache/1/thumbnail/600x800/9df78eab33525d08d6e5fb8d27136e95/r/e/refrigerante-guaran_-antarctica-2-litros.jpg',
                  labelProduto: 'Guraraná Antártica',
                  price: '5,00',
                ),
                Produto(
                  imagemProduto: 'https://www.imigrantesbebidas.com.br/bebida/images/products/full/1988-refrigerante-coca-cola-lata-220ml.jpg',
                  labelProduto: 'Coca',
                  price: '5,00',
                ),
                Produto(
                  imagemProduto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUeSMuUr9Od0lBZIgp_uBqcoIMfIXoxd_Zyw&usqp=CAU',
                  labelProduto: 'Fanta',
                  price: '5,00',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
