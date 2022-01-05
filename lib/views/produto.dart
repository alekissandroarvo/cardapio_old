import 'package:flutter/material.dart';

class Produto extends StatelessWidget {
  Produto({Key? key, this.imagemProduto, this.labelProduto, this.price});
  final String? imagemProduto;
  final String? labelProduto;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Image.network(
              imagemProduto!,
              width: MediaQuery.of(context).size.height * 0.25,
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            Text(labelProduto!),
            Text('R\$ ${price!}'),
          ],
        ),
      ),
    );
  }
}
