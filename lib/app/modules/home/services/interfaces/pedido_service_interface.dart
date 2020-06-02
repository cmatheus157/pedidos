import 'package:pedidos/app/modules/home/models/pedido_model.dart';

abstract class IPedidoService {
  Stream<List<PedidoModel>> get();
  Future save(PedidoModel model);
  Future delete(PedidoModel model);
}
