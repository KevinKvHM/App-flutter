import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/view/bar_gradient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _oficinaController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode fullNameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode oficinaFocusNode = FocusNode();
/*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailFocusNode = FocusNode();
passwordFocusNode = FocusNode();
fullNameFocusNode = FocusNode();
phoneFocusNode = FocusNode();
oficinaFocusNode = FocusNode();
  }*/
  @override
  void dispose() {
    super.dispose();

    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _oficinaController.dispose();

    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    phoneFocusNode.dispose();
    oficinaFocusNode.dispose();

    _obscurePassword.dispose();
  }

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        /*  appBar: AppBar(
         title: Text("CREAR CUENTA"),
          centerTitle: true,
        ),*/
        body: SafeArea(
            child: SingleChildScrollView(
      child: Form(
        key: _keyForm,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BarGradient("Crear Cuenta", Icons.edit_calendar),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _fullNameController,
                keyboardType: TextInputType.text,
                focusNode: fullNameFocusNode,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Ingrese Su Nombre Completo',
                  labelText: 'Nombre Completo',
                  prefixIcon: Icon(Icons.person_add_alt_1_sharp),
                ),
                validator: (valor) {
                  if (valor!.isEmpty) {
                    return "Ingresar Su Nombre Completo";
                  }
                  return null;
                },
                onEditingComplete: () =>
                    Utils.fielFocusSignUp(context, emailFocusNode),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Ingrese Su Correo Electronico',
                  labelText: 'Correo Electronico',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Formato incorrecto Ejemplo: correo@dominio.com';
                  }
                  return null;
                },
                onEditingComplete: () =>
                    Utils.fielFocusSignUp(context, passwordFocusNode),
                textInputAction: TextInputAction.next,
              ),
            ),
            ValueListenableBuilder(
                valueListenable: _obscurePassword,
                builder: (context, value, child) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    height: 80,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
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
                              _obscurePassword.value = !_obscurePassword.value;
                            },
                            child: Icon(_obscurePassword.value
                                ? Icons.visibility_off
                                : Icons.visibility)),
                      ),
                      validator: (value) {
                        if (value!.length < 8) {
                          return "Ingrese minimo 8 caracteres";
                        }
                        return null;
                      },
                      onEditingComplete: () =>
                          Utils.fielFocusSignUp(context, phoneFocusNode),
                      textInputAction: TextInputAction.next,
                    ),
                  );
                }),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 90,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _phoneController,
                focusNode: phoneFocusNode,
                maxLength: 10,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Ingrese Su Numero De Telefono',
                  labelText: 'Telefono',
                  prefixIcon: Icon(Icons.phone),
                ),
                onEditingComplete: () =>
                    Utils.fielFocusSignUp(context, oficinaFocusNode),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _oficinaController,
                focusNode: oficinaFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Ingrese El Nombre De La Oficina',
                  labelText: 'Nombre De La Oficna',
                  prefixIcon: Icon(Icons.add_business),
                ),
                validator: (valor) {
                  if (valor!.isEmpty) {
                    return "Campo requerido";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: height * .085,
            ),
            RoundButton(
              title: "Crear Cuenta",
              loading: authViewModel.signUpLoading,
              onPress: () {
                if (_keyForm.currentState!.validate()) {
                  print("validadcion correcta");
                  Map data = {
                    'full_name': _fullNameController.text.toString(),
                    'email': _emailController.text.toString(),
                    'password': _passwordController.text.toString(),
                    'number_phone': _phoneController.text.toString(),
                    'oficina': _oficinaController.text.toString(),
                  };
                  authViewModel.signUpApi(data, context);
                  print("api pegar");
                } else {
                  Utils.flushBarErrorMessage(
                      "Rellenar los campos en rojo", context);
                  print("validacion incorrecta");
                }

                /* if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      "Por Favor Ingresa El Correo Electronico", context);
                } else if (_passwordController.text.isEmpty ||
                    _passwordController.text.length < 8) {
                  Utils.flushBarErrorMessage(
                      "Por Favor Ingresa La Contraseña Con Minimo 8 Carcateres",
                      context);
                } else if (_fullNameController.text.isEmpty ||
                    _phoneController.text.isEmpty ||
                    _oficinaController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      "Por Favor Ingresa Todos Los Campos", context);
                } else {
                 
                 
                }*/
              },
            ),
            SizedBox(
              height: height * .02,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text("¿Tienes una cuenta? Iniciar Sesión")),
            SizedBox(
              height: height * .060,
            ),
          ],
        ),
      ),
    )));
  }
}
