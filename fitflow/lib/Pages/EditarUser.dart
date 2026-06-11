import 'package:fitflow/WidgetsPersonalizados/TextFieldsDoUserEdit.dart';
import 'package:flutter/material.dart';

class Editaruser extends StatefulWidget {
  final String urlDaImage;

  const Editaruser(this.urlDaImage, {super.key});

  @override
  State<Editaruser> createState() => _EditaruserState();
}

class _EditaruserState extends State<Editaruser> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController senhaNovaController = TextEditingController();
  TextEditingController senhaVelhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF413B6B),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            color: Colors.transparent,
            height: 190,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(width: 20),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: widget.urlDaImage.isNotEmpty
                          ? AssetImage(widget.urlDaImage)
                          : null,
                      child: widget.urlDaImage.isEmpty
                          ? const Icon(
                              Icons.person_outline,
                              size: 40,
                              color: Colors.black,
                            )
                          : null,
                    ),
                    GestureDetector(
                      onTap: () {
                        print('ola');
                      },
                      child: Icon(Icons.edit, color: Color(0xFF301c41)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'User_name',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'fredoka',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                  endIndent: 5,
                  indent: 5,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 530,
            child: Center(
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 10, bottom: 10),
                        child: Text(
                          'Mude suas informações',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'fredoka',
                            fontSize: 20,
                          ),
                        ),
                      ),

                      //email , nome , idade , mora , senha
                      Textfieldsdouseredit(
                        'Nome de usuário',
                        false,
                        userNameController,
                        117,
                      ),
                      SizedBox(height: 10),
                      Textfieldsdouseredit('Nome', false, nameController, 199),
                      SizedBox(height: 10),
                      Textfieldsdouseredit(
                        'Email',
                        false,
                        emailController,
                        201,
                      ),
                      SizedBox(height: 10),
                      Textfieldsdouseredit(
                        'Idade',
                        false,
                        idadeController,
                        203,
                      ),
                      SizedBox(height: 10),
                      Textfieldsdouseredit(
                        'Cidade que mora',
                        false,
                        cidadeController,
                        120,
                      ),
                      SizedBox(height: 10),
                      Textfieldsdouseredit(
                        'Senha nova',
                        true,
                        senhaNovaController,
                        160,
                      ),
                      SizedBox(height: 20),
                      Textfieldsdouseredit(
                        'Confirme sua senha antiga',
                        true,
                        senhaVelhaController,
                        50,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 10),
                        child: GestureDetector(
                          onTap: () {
                            print(
                              'userName : ' +
                                  userNameController.text +
                                  ' name : ' +
                                  nameController.text +
                                  ' email : ' +
                                  emailController.text +
                                  ' idade : ' +
                                  idadeController.text +
                                  ' cidade : ' +
                                  cidadeController.text +
                                  ' senhaNova : ' +
                                  senhaNovaController.text +
                                  ' senhaVelha : ' +
                                  senhaVelhaController.text,
                            );
                          },
                          child: Container(
                            width: 120,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFF301C41),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Atualizar",
                              style: TextStyle(
                                fontFamily: 'fredoka',
                                color: Colors.white,
                                fontWeight: FontWeight(400),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
