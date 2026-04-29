import 'package:fitflow/Pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:fitflow/WidgetsPersonalizados/ContainersWelcome.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
                  fontFamily: 'fedroka',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 100),
            WelcomeContainers(
              Color(0xFF5C65C0),
              40,
              300,
              'Já tenho uma conta',
              '',
              false,
              20,
              Login(),
              false,
              0,
              true,
              false,
            ),

            SizedBox(height: 30),
            WelcomeContainers(
              Color(0xFF301C41),
              40,
              260,
              'Não tenho conta',
              'http://127.0.0.1:8000/',
              true,
              20,
              Welcome(),
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
