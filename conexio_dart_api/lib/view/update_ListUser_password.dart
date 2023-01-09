import 'package:conexio_dart_api/res/components/round_button.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view/bar_gradient.dart';
import 'package:conexio_dart_api/view_model/home_view_model.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenListUserPasswordUpdate extends StatefulWidget {
  final userId;

  //final nameRole;
  const HomeScreenListUserPasswordUpdate({
    super.key,
    this.userId,
  });

  @override
  State<HomeScreenListUserPasswordUpdate> createState() =>
      _HomeScreenListUserPasswordUpdateState();
}

class _HomeScreenListUserPasswordUpdateState
    extends State<HomeScreenListUserPasswordUpdate> {
  TextEditingController _userId = TextEditingController();

  TextEditingController _password = TextEditingController();

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  @override
  void getUser() {
    _userId.text = widget.userId.toString();
  }

  UserViewModel getSharedPreferences = UserViewModel();
  String? token;

  @override
  void initState() {
    getSharedPreferences;
    super.initState();
    getSharedPreferences
        .getUser()
        .then((value) => {token = value.token, setState(() {})});
    getUser();
  }

  FocusNode idUserFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    idUserFocusNode.dispose();

    passwordFocusNode.dispose();

    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    //print("valor de la segunda pantalla $_idRegion $_editNameRegion ");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BarGradient("Actualizar Usuario", Icons.update),
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
                        controller: _password,
                        obscureText: _obscurePassword.value,
                        focusNode: passwordFocusNode,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          hintText: 'Ingrese Su Nueva Contraseña',
                          labelText: 'Contraseña Nueva',
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
                        validator: (value) {
                          if (value!.length < 8) {
                            return "Ingrese minimo 8 caracteres";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                      ),
                    );
                  }),
              SizedBox(
                height: height * .030,
              ),
              RoundButton(
                title: "Actualizar",
                loading: homeViewModel.putLoading,
                onPress: () {
                  // print(_editNameRegion);
                  // print(_idRegion);
                  if (_password.text.isEmpty || _password.text.length < 8) {
                    Utils.flushBarErrorMessage(
                        "Por Favor Ingresa Su Contraseña Con Minimo 8 Caracteres",
                        context);
                  } else {
                    Map data = {
                      'password': _password.text.toString(),
                    };

                    homeViewModel.putListUserPassword(
                        widget.userId, data, token.toString(), context);
                  }
                },
              ),
              SizedBox(
                height: height * .05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
