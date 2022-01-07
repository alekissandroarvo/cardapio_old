import 'package:alekissandroarvo/views/produto.dart';

import 'produtoclass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference pedido = FirebaseFirestore.instance.collection('pedidos');

class Pedido {
  String? table;
  Produto? produto;
  String? horario;
  String? cliente;
  String? quantidade;
  Pedido(
      {this.cliente, this.table, this.horario, this.produto, this.quantidade});
  Future<void> addPedido() {
    // Call the user's CollectionReference to add a new user
    return pedido.add({
      'table': table, // John Doe
      'horario': horario, // Stokes and Sons
      'cliente': cliente,
      'produto': produto,
      'quantidade': quantidade // 42
    });
  }

  Future<void> deletePedido(String documento) {
    // Call the user's CollectionReference to add a new user
    return pedido.doc(documento).delete();
  }

  Future<void> updatePedido(String documento, String field, String value) {
    // Call the user's CollectionReference to add a new user
    return pedido.doc(documento).update({'$field': '$value'});
  }
}
