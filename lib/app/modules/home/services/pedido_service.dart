import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pedidos/app/modules/home/models/pedido_model.dart';
import 'package:pedidos/app/modules/home/repositories/interfaces/pedido_repository_interface.dart';
import 'package:pedidos/app/modules/home/services/interfaces/pedido_service_interface.dart';

class PedidoService extends Disposable implements IPedidoService {
  @override
  void dispose() {}

  final IPedidoRepository pedidoRepository;
  PedidoService({@required this.pedidoRepository});
  @override
  Future delete(PedidoModel model) {
    return pedidoRepository.delete(model);
  }

  @override
  Stream<List<PedidoModel>> get() {
    return pedidoRepository.get();
  }

  @override
  Future save(PedidoModel model) {
    return pedidoRepository.save(model);
  }
}
