import 'package:pedidos/app/modules/home/models/cliente_model.dart';

abstract class IClienteRepository {
  Stream<List<ClienteModel>> get();
  Future save(ClienteModel model);
  Future delete(ClienteModel model);
}
