import 'package:conexio_dart_api/data/response/status.dart';
import 'package:conexio_dart_api/model/user_model.dart';
import 'package:conexio_dart_api/res/color.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view_model/school/home_view_model_school.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:provider/provider.dart';

class HomeScreenListEmails extends StatefulWidget {
  const HomeScreenListEmails({super.key});

  @override
  State<HomeScreenListEmails> createState() => _HomeScreenListEmailsState();
}

class _HomeScreenListEmailsState extends State<HomeScreenListEmails> {
  HomeViewModelScholl homeViewModelScholl = HomeViewModelScholl();

  UserViewModel getSharedPreferences = UserViewModel();
  String? token;
  dynamic? listaSchools;
  String? enviarEmail;
  Role roleData = Role();
  @override
  void initState() {
    getSharedPreferences;
    super.initState();
    getSharedPreferences.getUser().then((value) => {
          token = value.token,
          roleData = value.user!.role!,
          setState(() {
            homeViewModelScholl.fechtSchoolListApi(token.toString());
          })
        });
  }

  void sendEmails() async {
    final Email email = Email(
      body: '',
      subject: '',
      recipients: [enviarEmail.toString()],
      isHTML: true,
    );
    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text("Lista de Emails"),
        centerTitle: true,
        backgroundColor: AppColors.grenSnackBar,
      ),
      body: ChangeNotifierProvider<HomeViewModelScholl>(
        create: (BuildContext context) => homeViewModelScholl,
        child: Consumer<HomeViewModelScholl>(builder: (context, value, _) {
          switch (value.schoolList.status!) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.schoolList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: value.schoolList.data!.schols!.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(11),
                    elevation: 8,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          onTap: () {},
                          onLongPress: () {},
                          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                          title: Text(
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                            "Email: " +
                                value.schoolList.data!.schols![index].email
                                    .toString() +
                                "\n",
                          ),
                          subtitle: Text(
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                            "Escuela: ${value.schoolList.data!.schols![index].nameSchool.toString()}\nResive atención: ${value.schoolList.data!.schols![index].director!.atencion}",
                          ),
                          trailing: Container(
                            width: 70,
                            child: Row(
                              children: [
                                Expanded(
                                  child: IconButton(
                                    color: AppColors.buttonColor,
                                    onPressed: () {
                                      if (roleData.nameRole == "administrador" ||
                                          roleData.nameRole ==
                                              "Administrador" ||
                                          roleData.nameRole == "admin") {
                                        enviarEmail = value.schoolList.data!
                                            .schols![index].email;
                                        sendEmails();
                                        print("Usuario si != " +
                                            roleData.nameRole.toString());
                                      } else {
                                        //enviarEmail = value.schoolList.data!
                                        // .schols![index].email;
                                        print("Usuario else " +
                                            roleData.nameRole.toString());
                                        Utils.toastMessage(
                                            "No estas autorizado para hacer estas accion");
                                        //sendEmails();
                                      }
                                      /*if (roleData.nameRole !=
                                              "administrador" ||
                                          roleData.nameRole !=
                                              "Administrador") {
                                        enviarEmail = value.schoolList.data!
                                            .schols![index].email;
                                        print(
                                            "Email: " + enviarEmail.toString());
                                        sendEmails();
                                      } else {
                                        Utils.toastMessage(
                                            "Solo el administrador puede realizar esta accion");
                                      }*/
                                    },
                                    icon: Icon(Icons.send),
                                  ),
                                )
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
        }),
      ),
    );
  }
}
