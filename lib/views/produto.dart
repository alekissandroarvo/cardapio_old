import 'package:flutter/material.dart';

class ProdutoWid extends StatelessWidget {
  ProdutoWid({Key? key, this.imagemProduto, this.labelProduto, this.price});
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
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Image.network(
                imagemProduto!,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              labelProduto!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('R\$ ${price!}'),
          ],
        ),
      ),
    );
  }
}
