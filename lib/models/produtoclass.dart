import 'package:cloud_firestore/cloud_firestore.dart';

class Produto {
  String? description;
  String? price;
  String? image;
  String? type;

  CollectionReference produto =
      FirebaseFirestore.instance.collection('produtos');

  Produto({this.description, this.image, this.price, this.type});
  Future<void> addProduto() {
    // Call the user's CollectionReference to add a new user
    return produto.add({
      'description': description, // John Doe
      'price': price, // Stokes and Sons
      'age': image,
      'type': type,
    });
  }

  Future<void> deleteProduto(String documento) {
    // Call the user's CollectionReference to add a new user
    return produto.doc(documento).delete();
  }

  Future<void> updateProduto(String documento, String field, String value) {
    // Call the user's CollectionReference to add a new user
    return produto.doc(documento).update({'$field': '$value'});
  }
}
