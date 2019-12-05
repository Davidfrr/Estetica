import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:petvac/models/funcionarios_model.dart';
import 'package:rxdart/rxdart.dart';

class FuncionariosRepository extends Disposable {
  CollectionReference _collection = Firestore.instance.collection('Funcionarios');

  void add(Funcionario funcionarios) => _collection.add(funcionarios.toMap());

  void update(String documentId, Funcionario funcionarios) =>
      _collection.document(documentId).updateData(funcionarios.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Observable<List<Funcionario>> get funcionarios =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<Funcionario>((document) => Funcionario.fromMap(document))
          .toList()));

  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {
  }
}
