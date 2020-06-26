import 'package:pedidos/app/modules/home/services/cliente_service.dart';
import 'package:pedidos/app/modules/home/repositories/cliente_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pedidos/app/modules/home/services/interfaces/cliente_service_interface.dart';
import 'package:pedidos/app/modules/home/services/interfaces/pedido_service_interface.dart';
import 'package:pedidos/app/modules/home/services/pedido_service.dart';
import 'package:pedidos/app/modules/home/repositories/pedido_repository.dart';
import 'package:pedidos/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pedidos/app/modules/home/home_page.dart';
import 'package:pedidos/app/modules/login/login_page.dart';

import 'repositories/interfaces/pedido_repository_interface.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) =>
            ClienteService(pedidoRepository: i.get<ClienteRepository>())),
        Bind((i) => ClienteRepository(firestore: Firestore.instance)),
        Bind<IPedidoService>(
            (i) => PedidoService(pedidoRepository: i.get<PedidoRepository>())),
        Bind<IPedidoRepository>(
            (i) => PedidoRepository(firestore: Firestore.instance)),
        Bind((i) => HomeController(
            pedidoService: i.get<IPedidoService>(),
            clienteService: i.get<IClienteService>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
