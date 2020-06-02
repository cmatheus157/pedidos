import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:pedidos/app/modules/home/models/cliente_model.dart';
import 'package:pedidos/app/modules/home/repositories/interfaces/cliente_repository_interface.dart';

class ClienteRepository extends Disposable implements IClienteRepository {
  final Firestore firestore;
  ClienteRepository({@required this.firestore});

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future delete(ClienteModel model) {
    return model.referencia.delete();
  }

  @override
  Stream<List<ClienteModel>> get() {
    return firestore
        .collection('clientes')
        .orderBy('razaoSocial')
        .snapshots()
        .map((query) => query.documents
            .map((doc) => ClienteModel.fromDocument(doc))
            .toList());
  }

  @override
  Future save(ClienteModel model) async {
    if (model.referencia == null) {
      model.referencia = await Firestore.instance.collection('clientes').add({
        'razaoSocial': model.razaoSocial,
        'bairro': model.bairro,
        'cep': model.cep,
        'cidade': model.cidade,
        'cnpj': model.cnpj,
        'email': model.email,
        'endereco': model.endereco,
        'estado': model.estado,
        'inscricaoEstadual': model.inscricaoEstadual,
      });
    } else {
      model.referencia.updateData({
        'razaoSocial': model.razaoSocial,
        'bairro': model.bairro,
        'cep': model.cep,
        'cidade': model.cidade,
        'cnpj': model.cnpj,
        'email': model.email,
        'endereco': model.endereco,
        'estado': model.estado,
        'inscricaoEstadual': model.inscricaoEstadual,
      });
    }
  }
}
