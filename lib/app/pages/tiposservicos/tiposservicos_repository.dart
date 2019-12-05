import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:petvac/models/tiposservicos_model.dart';
import 'package:rxdart/rxdart.dart';

class TiposServicosRepository extends Disposable {
  CollectionReference _collection = Firestore.instance.collection('TiposServicos'); 
  TiposServicos _tiposServicos;

  TiposServicos getTiposServicos() => _tiposServicos;

  void add(TiposServicos tiposservicos) => _collection.add(tiposservicos.toMap());

  void update(String documentId, TiposServicos tiposservicos) =>
      _collection.document(documentId).updateData(tiposservicos.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Observable<List<TiposServicos>> get tiposservicos =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<TiposServicos>((document) => TiposServicos.fromMap(document))
          .toList()));

  Observable<TiposServicos> tiposServicosId(String tiposServicosId) => 
    Observable(_collection.document(tiposServicosId).snapshots().map<TiposServicos>(
      (document) => TiposServicos.fromMap(document)));
  
  Future<TiposServicos> getTiposServicosById(String _tiposServicosId) async {
    DocumentSnapshot tiposServicos = await _collection.document(tiposservicosId).get();

    _tiposServicos = TiposServicos.fromMap(tiposServicos);

    return _tiposServicos;
  }
  
  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
