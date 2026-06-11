import 'package:fitflow/Pages/Cadastro.dart';
import 'package:fitflow/Pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:fitflow/WidgetsPersonalizados/ContainersWelcome.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C0B2B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/img/LogoMaisSombreada.png'),
              width: 250,
              height: 145,
            ),
            Container(
              height: 100,
              width: 300,
              child: Text(
                'Bem vindo ao FitFlow',
                style: TextStyle(
                  color: Color(0xFF5c65c0),
                  fontSize: 40,
                  fontWeight: FontWeight(200),
                  fontFamily: 'fredoka',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 100),
            ContainersWelcome(
              Color(0xFF5C65C0),
              60,
              300,
              'Já tenho uma conta',
              '',
              false,
              15,
              Login(),
              false,
              0,
              true,
              false,
            ),

            SizedBox(height: 20),
            ContainersWelcome(
              Color(0xFF301C41),
              60,
              260,
              'Não tenho conta',
              '',
              false,
              15,
              Cadastro(),
              false,
              0,
              true,
              false,
            ),
          ],
        ),
      ),
    );
  }
}
