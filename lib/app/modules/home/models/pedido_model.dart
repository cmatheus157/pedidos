import 'package:cloud_firestore/cloud_firestore.dart';

class PedidoModel {
  String nome;
  String cnpj;
  bool enviado;
  DocumentReference referencia;
  int id;

  PedidoModel(
      {this.nome = '',
      this.id,
      this.enviado = false,
      this.referencia,
      this.cnpj = ''});

  factory PedidoModel.fromDocument(DocumentSnapshot doc) {
    return PedidoModel(
      enviado: doc['enviado'],
      nome: doc['nome'],
      referencia: doc.reference,
      cnpj: doc['cnpj'],
    );
  }
  factory PedidoModel.fromJson(Map<String, dynamic> json) {
    return PedidoModel(
        enviado: json['enviado'], nome: json['nome'], id: json['id']);
  }
  Map<String, dynamic> toJson() => {};
}
