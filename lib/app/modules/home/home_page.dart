import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cadastro_page.dart';
import 'home_controller.dart';
import 'models/pedido_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Cliente"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: CadastroPage());
  }

  _showDialog({PedidoModel model}) {
    model ??= PedidoModel();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(model.referencia == null ? 'Adicionar' : 'Alterar'),
            content: TextFormField(
              initialValue: model.nome,
              onChanged: (v) => model.nome = v,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'escreva...',
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Modular.to.pop();
                },
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: () {
                  controller.save(model);
                  Modular.to.pop();
                },
                child: Text('Adicionar'),
              ),
            ],
          );
        });
  }
}
