import 'package:fitflow/Pages/Login.dart';
import 'package:fitflow/WidgetsPersonalizados/ContainersWelcome.dart';
import 'package:fitflow/WidgetsPersonalizados/TextFieldsDoUserEdit.dart';
import 'package:flutter/material.dart';

class Editaruser extends StatelessWidget {
  const Editaruser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF413B6B),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            color: Colors.transparent,
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(left: 25),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image(
                        image: AssetImage('assets/img/userProfile.png'),
                      ),
                    ),
                    Icon(Icons.edit, color: Color(0xFF301c41)),
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
                Divider(
                  color: Colors.white,
                  thickness: 1,
                  endIndent: 5,
                  indent: 5,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //email , nome , idade , mora , senha
                Textfieldsdouseredit('Usuário', false),
                Textfieldsdouseredit('Email', false),
                Textfieldsdouseredit('Nome', false),
                Textfieldsdouseredit('Idade', false),
                Textfieldsdouseredit('Cidade', false),
                Textfieldsdouseredit('Senha', true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
