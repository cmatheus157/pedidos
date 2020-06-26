import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pedidos/app/modules/login/login_widgets.dart';
import 'package:pedidos/app/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  IconData iconesenha = Icons.visibility;
  bool mostrarsenha = true;

  Widget tfSenha() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Senha',
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          decoration: cBoxDecorationStyle,
          child: TextField(
            obscureText: mostrarsenha,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.white,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  iconesenha,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    mostrarsenha = !mostrarsenha;
                    if (mostrarsenha)
                      iconesenha = Icons.visibility;
                    else {
                      iconesenha = Icons.visibility_off;
                    }
                  });
                },
              ),
              hintText: 'Digite sua senha',
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.green[900],
                    Colors.green[700],
                    Colors.green[500],
                    Colors.green[300],
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    tfWidget(Icons.mail_outline, 'Email'),
                    SizedBox(height: 30.0),
                    tfSenha(),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 5.0,
                        onPressed: () {
                          controller.signInWithGoogle();
                          print('Login Button Pressed');
                        },
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.white,
                        child: Text(
                          'Conectar',
                          style: TextStyle(
                            color: Colors.green[800],
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                    buildSignInWithText(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          buildSocialBtn(
                            () => print('Login com Facebook'),
                            AssetImage(
                              'assets/logos/facebook.jpg',
                            ),
                          ),
                          buildSocialBtn(
                            () => print('Login com Google'),
                            AssetImage(
                              'assets/logos/google.jpg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    //buildSocialBtnRow(),
                    buildSignupBtn(),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
