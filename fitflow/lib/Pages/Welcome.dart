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
              cor: Color(0xFF5C65C0),
              altura: 60,
              comprimento: 300,
              texto: 'Já tenho uma conta',
              url: null,
              webOrMob: false,
              radius: 15,
              classe: Login(),
              splash: false,
              segs: 0,
              volta: true,
              saiApp: false,
              notOnlyDecoracao: true,
            ),

            SizedBox(height: 20),
            ContainersWelcome(
              cor: Color(0xFF301C41),
              altura: 60,
              comprimento: 260,
              texto: 'Não tenho conta',
              url: null,
              webOrMob: false,
              radius: 15,
              classe: Cadastro(),
              splash: false,
              segs: 0,
              volta: true,
              saiApp: false,
              notOnlyDecoracao: true,
            ),
          ],
        ),
      ),
    );
  }
}
