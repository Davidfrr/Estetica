import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:petvac/models/clientes_model.dart';
import 'package:rxdart/rxdart.dart';

class ClientesRepository extends Disposable {
  CollectionReference _collection = Firestore.instance.collection('Clientes');

  void add(Clientes clientes) => _collection.add(clientes.toMap());

  void update(String documentId, Clientes clientes) =>
      _collection.document(documentId).updateData(clientes.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Observable<List<Clientes>> get clientes =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<Clientes>((document) => Clientes.fromMap(document))
          .toList()));

  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }
  
  //dispose will be called automatically
  @override
  void dispose() {}
}


