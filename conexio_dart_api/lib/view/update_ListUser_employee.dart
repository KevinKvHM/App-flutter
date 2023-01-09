import 'package:conexio_dart_api/res/components/round_button.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view/bar_gradient.dart';
import 'package:conexio_dart_api/view_model/home_view_model.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenListUserUpdateEmployee extends StatefulWidget {
  final employeeId;
  final fullName;
  final phone;
  final oficina;

  const HomeScreenListUserUpdateEmployee(
      {super.key, this.employeeId, this.fullName, this.phone, this.oficina});

  @override
  State<HomeScreenListUserUpdateEmployee> createState() =>
      _HomeScreenListUserUpdateEmployeeState();
}

class _HomeScreenListUserUpdateEmployeeState
    extends State<HomeScreenListUserUpdateEmployee> {
  TextEditingController _employeeId = TextEditingController();

  TextEditingController _fullName = TextEditingController();
  TextEditingController _oficina = TextEditingController();
  TextEditingController _phone = TextEditingController();

  @override
  void getUser() {
    _employeeId.text = widget.employeeId.toString();
    _fullName.text = widget.fullName.toString();
    _oficina.text = widget.oficina.toString();
    _phone.text = widget.phone.toString();
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

  FocusNode idEmployeeFocusNode = FocusNode();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode oficinaFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    idEmployeeFocusNode.dispose();
    fullNameFocusNode.dispose();
    phoneFocusNode.dispose();
    oficinaFocusNode.dispose();
  }

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    //print("valor de la segunda pantalla $_idRegion $_editNameRegion ");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                BarGradient("Actualizar Datos Personales", Icons.update),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  height: 80,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    controller: _fullName,
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
                        Utils.fielFocusSignUp(context, phoneFocusNode),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  height: 90,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    controller: _phone,
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
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  height: 80,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    controller: _oficina,
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
                  height: height * .030,
                ),
                RoundButton(
                  title: "Actualizar",
                  loading: homeViewModel.putLoading,
                  onPress: () {
                    if (_keyForm.currentState!.validate()) {
                      Map data = {
                        'full_name': _fullName.text.toString(),
                        'number_phone': _phone.text.toString(),
                        'oficina': _oficina.text.toString(),
                      };

                      homeViewModel.putListEmployeeData(
                          widget.employeeId, data, token.toString(), context);
                    } else {
                      Utils.flushBarErrorMessage(
                          "Rellenar los campos en rojo", context);
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
      ),
    );
  }
}
