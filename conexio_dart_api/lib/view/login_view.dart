import 'package:conexio_dart_api/res/color.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view/bar_gradient.dart';
import 'package:conexio_dart_api/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return WillPopScope(
        onWillPop: () => Utils.closedApp(context),
        //_closeApp(context),
        child: Scaffold(
            body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              BarGradient(
                  "Directorios Escolares De Educación Básica", Icons.school),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                height: 80,
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocusNode,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese Su Correo Electronico',
                    labelText: 'Correo Electronico',
                    prefixIcon: Icon(Icons.email),
                  ),
                  onFieldSubmitted: (valu) {
                    Utils.fielFocusChange(
                        context, emailFocusNode, passwordFocusNode);
                  },
                ),
              ),
              ValueListenableBuilder(
                  valueListenable: _obscurePassword,
                  builder: (context, value, child) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      height: 80,
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword.value,
                        focusNode: passwordFocusNode,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          hintText: 'Ingrese Su Contraseña',
                          labelText: 'Contraseña',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obscurePassword.value =
                                    !_obscurePassword.value;
                              },
                              child: Icon(_obscurePassword.value
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: height * .085,
              ),
              RoundButton(
                title: "Iniciar Sesiòn",
                loading: authViewModel.loading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        "Por Favor Ingresa El Correo Electronico", context);
                  } else if (_passwordController.text.isEmpty ||
                      _passwordController.text.length < 8) {
                    Utils.flushBarErrorMessage(
                        "Por Favor Ingresa La Contraseña Con Minimo 8 Carcateres",
                        context);
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };

                    authViewModel.loginApi(data, context);
                    // print("api pegar");
                  }
                },
              ),
              SizedBox(
                height: height * .02,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.signUp);
                  },
                  child: Text("No tienes cuenta? Crear Cuenta"))
            ],
          )),
        )));
  }
}
