import 'package:conexio_dart_api/data/response/status.dart';
import 'package:conexio_dart_api/model/user_list_model.dart';
import 'package:conexio_dart_api/res/components/round_button.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view/bar_gradient.dart';
import 'package:conexio_dart_api/view_model/home_view_model.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenRoleUpdateUser extends StatefulWidget {
  final idUser;
  final nameRole;
  const ScreenRoleUpdateUser({super.key, this.idUser, this.nameRole});

  @override
  State<ScreenRoleUpdateUser> createState() => _ScreenRoleUpdateUserState();
}

class _ScreenRoleUpdateUserState extends State<ScreenRoleUpdateUser> {
  HomeViewModel homeViewModelRole = HomeViewModel();
  dynamic? selectedValue;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController _idUserController = TextEditingController();
  final TextEditingController _idRoleController = TextEditingController();

  FocusNode idUserFocusNode = FocusNode();
  FocusNode idRoleFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _idUserController.dispose();
    _idRoleController.dispose();
  }

  void getDataUser() {
    _idUserController.text = this.widget.idUser;

    _idRoleController.text = this.widget.nameRole;
    print(
        "valor id: ${this.widget.idUser}\n\nValor id Rol: ${this.widget.nameRole}");
  }

  void setIdRole() {
    setState(() {
      _idRoleController.text = selectedValue.id.toString();
    });
  }

  UserViewModel getSharedPreferences = UserViewModel();
  String? token;

  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    getSharedPreferences;
    super.initState();
    getSharedPreferences.getUser().then((value) => {
          token = value.token,
          setState(() {
            homeViewModelRole.fechtRolesListApi(token.toString());
          })
        });
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                BarGradient("Actualizar Privilegios", Icons.create_new_folder),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ListTile(
                      leading: Icon(
                        Icons.list,
                        color: Colors.teal,
                      ),
                      title: Text(
                        "Roles De Usuario Donde:\n\n1 es Administrador\n\n2 es Usuario Normal",
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: "SourceSansPro",
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ChangeNotifierProvider<HomeViewModel>(
                    create: (BuildContext context) => homeViewModelRole,
                    child:
                        Consumer<HomeViewModel>(builder: (context, lista, _) {
                      switch (lista.rolesList.status!) {
                        case Status.LOADING:
                          return Center(child: CircularProgressIndicator());
                        case Status.ERROR:
                          return Center(
                              child: Text(lista.rolesList.message.toString()));
                        case Status.COMPLETED:
                          //var index;
                          return Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                //barrierColor: Colors.blue,
                                buttonDecoration: BoxDecoration(
                                  color: Color.fromARGB(255, 235, 235, 235),
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      style: BorderStyle.solid,
                                      width: 0.80),
                                ),
                                isExpanded: true,
                                hint: Row(
                                  children: [
                                    Icon(
                                      Icons.list,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        this.widget.nameRole,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Theme.of(context).hintColor,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        //selectionColor: Colors.amberAccent,
                                      ),
                                    ),
                                  ],
                                ),

                                items: lista.rolesList.data!.roles!
                                    .map((nombre_role) =>
                                        DropdownMenuItem<dynamic>(
                                          //value: nombre_region.id.toString(),
                                          value: nombre_role,

                                          child: Text(
                                            nombre_role.nameRole.toString(),
                                            //nombre_region.toString(),

                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as dynamic;

                                    print(selectedValue.id);
                                  });
                                },
                                buttonHeight: 50,
                                buttonWidth: 350,
                                itemHeight: 50,
                                dropdownMaxHeight: 400,
                                buttonPadding:
                                    const EdgeInsets.only(left: 25, right: 25),
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Color.fromARGB(255, 235, 235, 235),
                                ),
                                searchController: searchController,
                                searchInnerWidget: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 8,
                                      bottom: 4,
                                      right: 8,
                                      left: 8,
                                    ),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == '') {
                                          print("no existe");
                                        }
                                      },
                                      controller: searchController,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 8,
                                        ),
                                        hintText: 'Buscar...',
                                        hintStyle: const TextStyle(
                                          fontSize: 12,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                searchMatchFn: (nombre_role, searchValue) {
                                  //print("Holamundo");

                                  var name = nombre_role.value!.nameRole!
                                      .toString()

                                      //.toLowerCase()
                                      .contains(searchValue.toLowerCase());

                                  return name;
                                },

                                //This to clear the search value when you close the menu
                                onMenuStateChange: (isOpen) {
                                  if (!isOpen) {
                                    searchController.clear();
                                  }
                                },
                              ),
                            ),
                          );
                      }
                    }),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  height: 90,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    controller: _idRoleController,
                    keyboardType: TextInputType.number,
                    focusNode: idRoleFocusNode,
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Ingrese El Numero del Rol',
                      labelText: 'Numero De Rol',
                      prefixIcon: Icon(Icons.privacy_tip_rounded),
                    ),
                    validator: (valor) {
                      if (valor!.isEmpty) {
                        return "Ingresar El Numero De Rol";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
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
                      print("validadcion correcta");
                      setIdRole();
                      Map data = {
                        'roleId': _idRoleController.text,
                      };
                      homeViewModel.putUserRole(
                          widget.idUser, data, token.toString(), context);
                      /* print(widget.idUser.toString());
                      print("Data user: ${data.toString()}");
                      print("Data token: ${token.toString()}");*/
                    } else {
                      Utils.flushBarErrorMessage(
                          "Rellenar los campos en rojo", context);
                    }
                  },
                ),
                SizedBox(
                  height: height * .03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    /*final homeViewModel = Provider.of<HomeViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    List listaRol = ["administrador", "usuario"];

    return Scaffold(
      appBar: AppBar(
        title: Text("Actualizar Rol"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * .20,
              ),
              Center(
                child: DropdownButtonFormField(
                  items: listaRol.map(
                    (rol) {
                      return DropdownMenuItem(
                        child: Text(rol),
                        value: rol,
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    print(value);

                    setState(
                      () {
                        if (value == "administrador") {
                          admin = _idRoleController.text = 1.toString();
                          print(admin);
                        } else if (value == "usuario") {
                          user = _idRoleController.text = 2.toString();
                          print(user);
                        }
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * .30,
              ),
              RoundButton(
                title: "guardar",
                loading: homeViewModel.putLoading,
                onPress: () {
                  Map data = {
                    'idRole': _idRoleController.text.toString(),
                  };

                  homeViewModel.putUserRole(
                      this.widget.idUser, data, token.toString(), context);
                  print(data);
                },
              ),
              SizedBox(
                height: height * .03,
              ),
            ],
          ),
        ),
      ),
    );*/
  }
}
