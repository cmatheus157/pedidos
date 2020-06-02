import 'package:cloud_firestore/cloud_firestore.dart';

class ClienteModel {
  String razaoSocial;
  String cidade;
  String estado;
  String cep;
  String bairro;
  String endereco;
  String email;
  String cnpj;
  String inscricaoEstadual;
  DocumentReference referencia;

  ClienteModel(
      {this.razaoSocial,
      this.bairro,
      this.cep,
      this.cidade,
      this.cnpj,
      this.email,
      this.endereco,
      this.estado,
      this.inscricaoEstadual,
      this.referencia});

  factory ClienteModel.fromDocument(DocumentSnapshot doc) {
    return ClienteModel(
      razaoSocial: doc['razaoSocial'],
      bairro: doc['bairro'],
      cep: doc['cep'],
      cidade: doc['cidade'],
      cnpj: doc['cnpj'],
      email: doc['email'],
      endereco: doc['endereco'],
      estado: doc['estado'],
      inscricaoEstadual: doc['inscricaoEstadual'],
      referencia: doc.reference,
    );
  }
}
