import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:pedidos/app/modules/home/models/pedido_model.dart';
import 'package:pedidos/app/modules/home/services/interfaces/pedido_service_interface.dart';

import 'models/cliente_model.dart';
import 'services/interfaces/cliente_service_interface.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IPedidoService pedidoService;
  final IClienteService clienteService;

  @observable
  ObservableStream<List<PedidoModel>> pedidoList;
  @observable
  ObservableStream<List<ClienteModel>> clienteList;

  _HomeControllerBase(
      {@required this.pedidoService, @required this.clienteService}) {
    getList();
  }
  @action
  void getList() {
    pedidoList = pedidoService.get().asObservable();
  }

  @action
  void save(PedidoModel model) {
    pedidoService.save(model);
  }

  @action
  void delete(PedidoModel model) {
    pedidoService.delete(model);
  }

  @action
  void getListClientes() {
    clienteList = clienteService.get().asObservable();
  }

  @action
  void saveCliente(ClienteModel model) {
    clienteService.save(model);
  }

  @action
  void deleteCliente(ClienteModel model) {
    clienteService.delete(model);
  }
}
