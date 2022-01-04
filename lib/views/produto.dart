import 'package:flutter/material.dart';

class Produto extends StatelessWidget {
  Produto({Key? key, this.imagemProduto, this.labelProduto, this.price});
  final String? imagemProduto;
  final String? labelProduto;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network(
            imagemProduto!,
            width: 100,
            height: 150,
          ),
          Text(labelProduto!),
          Text('R\$ ${price!}'),
        ],
      ),
    );
  }
}
