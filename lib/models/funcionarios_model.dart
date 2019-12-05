import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelo_base.dart';

class Funcionario extends ModeloBase {
  String _documentId;
  String nome;

  Funcionario();

  Funcionario.fromMap(DocumentSnapshot documento) {
    _documentId = documento.documentID;

    this.nome = documento.data["Nome"];
    
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['nome'] = this.nome;
   
    return map;
  }

  @override
  String documentId() => _documentId;
}
