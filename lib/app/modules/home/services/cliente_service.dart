import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pedidos/app/modules/home/models/cliente_model.dart';
import 'package:pedidos/app/modules/home/repositories/interfaces/cliente_repository_interface.dart';
import 'package:pedidos/app/modules/home/services/interfaces/cliente_service_interface.dart';

class ClienteService extends Disposable implements IClienteService {
  //dispose will be called automatically
  @override
  void dispose() {}
  final IClienteRepository pedidoRepository;
  ClienteService({@required this.pedidoRepository});
  @override
  Future delete(ClienteModel model) {
    return pedidoRepository.delete(model);
  }

  @override
  Stream<List<ClienteModel>> get() {
    return pedidoRepository.get();
  }

  @override
  Future save(ClienteModel model) {
    return pedidoRepository.save(model);
  }
}
