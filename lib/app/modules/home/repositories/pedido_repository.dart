import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:pedidos/app/modules/home/models/pedido_model.dart';

import 'interfaces/pedido_repository_interface.dart';

class PedidoRepository extends Disposable implements IPedidoRepository {
  final Firestore firestore;
  PedidoRepository({@required this.firestore});

  // dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future delete(PedidoModel model) {
    return model.referencia.delete();
  }

  @override
  Stream<List<PedidoModel>> get() {
    return firestore.collection('pedidos').orderBy('nome').snapshots().map(
        (query) => query.documents
            .map((doc) => PedidoModel.fromDocument(doc))
            .toList());
  }

  @override
  Future save(PedidoModel model) async {
    var total = (await Firestore.instance.collection('pedidos').getDocuments())
        .documents
        .length;

    if (model.referencia == null) {
      model.referencia = await Firestore.instance.collection('pedidos').add({
        'nome': model.nome,
        'enviado': model.enviado,
        'position': total,
      });
    } else {
      model.referencia.updateData({
        'nome': model.nome,
        'enviado': model.enviado,
      });
    }
  }
}
