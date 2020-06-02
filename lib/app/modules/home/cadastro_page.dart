import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'models/cliente_model.dart';
import 'models/pedido_model.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  HomeController controle = Modular.get<HomeController>();
  ClienteModel model = ClienteModel();
  TextEditingController razaoSocialController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController estadoController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();
  TextEditingController inscricaoEstadualController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: 'Razão Social'),
              style: TextStyle(fontSize: 24),
              controller: razaoSocialController,
              keyboardType: TextInputType.text,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(labelText: 'Bairro'),
              style: TextStyle(fontSize: 24),
              controller: bairroController,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(labelText: 'Cidade'),
              style: TextStyle(fontSize: 24),
              controller: cidadeController,
              keyboardType: TextInputType.text,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(labelText: 'Estado'),
              style: TextStyle(fontSize: 24),
              controller: estadoController,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(labelText: 'Endereço'),
              style: TextStyle(fontSize: 24),
              controller: enderecoController,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(labelText: 'CEP'),
              style: TextStyle(fontSize: 24),
              controller: cepController,
              keyboardType: TextInputType.number,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(labelText: 'CNPJ'),
              style: TextStyle(fontSize: 24),
              controller: cnpjController,
              keyboardType: TextInputType.number,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(labelText: 'Inscrição Estadual'),
              style: TextStyle(fontSize: 24),
              controller: inscricaoEstadualController,
              keyboardType: TextInputType.number,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(labelText: 'E-mail'),
              style: TextStyle(fontSize: 24),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            Divider(),
            RaisedButton(
              child: Text("Cadastrar Cliente"),
              onPressed: () {
                // model ??= ClienteModel();
                model.razaoSocial = razaoSocialController.text;
                model.cidade = cidadeController.text;
                model.estado = estadoController.text;
                model.cep = cepController.text;
                model.bairro = bairroController.text;
                model.endereco = enderecoController.text;
                model.email = emailController.text;
                model.cnpj = cnpjController.text;
                model.inscricaoEstadual = inscricaoEstadualController.text;
                controle.saveCliente(model);
                model = ClienteModel();
              },
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
            )
          ],
        ),
      ),
    ));
  }
}
