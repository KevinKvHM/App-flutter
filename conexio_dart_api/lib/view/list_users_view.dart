import 'package:conexio_dart_api/data/response/status.dart';
import 'package:conexio_dart_api/model/user_model.dart';
import 'package:conexio_dart_api/res/color.dart';
import 'package:conexio_dart_api/view/details_user.dart';
import 'package:conexio_dart_api/view/update_ListUser_employee.dart';
import 'package:conexio_dart_api/view_model/home_view_model.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListUserView extends StatefulWidget {
  const ListUserView({super.key});

  @override
  State<ListUserView> createState() => _ListUserViewState();
}

class _ListUserViewState extends State<ListUserView> {
  HomeViewModel homeViewModel = HomeViewModel();

  /*User userData = User();
  Employee employeeData = Employee();
  Role roleData = Role();*/
  UserViewModel getSharedPreferences = UserViewModel();
  String? token;

  @override
  void initState() {
    getSharedPreferences;

    super.initState();
    getSharedPreferences.getUser().then((value) => {
          //userData = value.user!,
          //employeeData = value.user!.employee!,
          //roleData = value.user!.role!,
          token = value.token,
          setState(() {
            homeViewModel.fetchUserListApi(token.toString());
            //print("valor del token: ${value.token}");
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista De Usuarios"),
        centerTitle: true,
        backgroundColor: AppColors.grenSnackBar,
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext contex) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, _) {
            switch (value.userList.status!) {
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(value.userList.message.toString()));
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: value.userList.data!.users!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.all(11),
                      elevation: 8,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailsUserView(
                                      value.userList.data!.users![index])));
                            },
                            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                            title: Text(
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                              ),
                              "Nombre: " +
                                  value.userList.data!.users![index].employee!
                                      .fullName
                                      .toString()
                                      .toUpperCase(),
                            ),
                            subtitle: Text(
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),
                                "Rol: " +
                                    value.userList.data!.users![index].role!
                                        .nameRole
                                        .toString()),
                            trailing: Container(
                              width: 70,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: IconButton(
                                          color: AppColors.buttonColor,
                                          onPressed: () {
                                            final employeeId = value
                                                .userList
                                                .data!
                                                .users![index]
                                                .employee!
                                                .id
                                                .toString();
                                            final fullName = value
                                                .userList
                                                .data!
                                                .users![index]
                                                .employee!
                                                .fullName
                                                .toString();
                                            final phone = value
                                                .userList
                                                .data!
                                                .users![index]
                                                .employee!
                                                .numberPhone
                                                .toString();
                                            final oficina = value.userList.data!
                                                .users![index].employee!.oficina
                                                .toString();
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreenListUserUpdateEmployee(
                                                  employeeId: employeeId,
                                                  fullName: fullName,
                                                  phone: phone,
                                                  oficina: oficina,
                                                ),
                                              ),
                                            );
                                          },
                                          icon: Icon(Icons.edit))),
                                  Expanded(
                                    child: IconButton(
                                      color: AppColors.buttonColor,
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                  "¿ Deseas Eliminar A ${value.userList.data!.users![index].employee!.fullName.toString()}?"),
                                              actions: [
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                      primary: Colors
                                                          .green.shade900),
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'Cancelar'),
                                                  child: const Text('Cancelar'),
                                                ),
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                      primary: Colors.red),
                                                  child: const Text('Eliminar'),
                                                  onPressed: () {
                                                    final idUser = value
                                                        .userList
                                                        .data!
                                                        .users![index]
                                                        .id
                                                        .toString();

                                                    print(
                                                        "DATo desde vista: $idUser");

                                                    setState(
                                                      () {
                                                        homeViewModel
                                                            .deleteUserApi(
                                                                idUser,
                                                                token
                                                                    .toString(),
                                                                context);
                                                      },
                                                    );
                                                    ;
                                                    print(
                                                        "Valor final del id region $idUser");
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(Icons.delete),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            leading: Icon(Icons.home),
                          ),
                        ],
                      ),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
