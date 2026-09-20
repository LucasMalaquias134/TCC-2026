import 'package:fitflow/Pages/Home.dart';
import 'package:fitflow/controle/tokenController.dart';
import 'package:fitflow/modelo/api/apiGeral.dart';
import 'package:fitflow/modelo/api/usersApi.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:fitflow/modelo/local_storage_service.dart';
import 'package:flutter/material.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  void barraDeFracasso(String texto) {
    SnackBar minhaSnack = SnackBar(
      content: Text(texto),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 6),
      showCloseIcon: true,
    );
    ScaffoldMessenger.of(context).showSnackBar(minhaSnack);
  }

  Future<void> atualizaInfo() async {
    User? usuarioAtivo = await LocalStorageService.carregarUsuario();
    String? token = await Tokencontroller.stringTokenCarregado();
    int resultado1 = await Usersapi.atualizaDados(token!);
    int resultado2 = await Apigeral.atualizaInfo(token, usuarioAtivo!.id);
    if (resultado1 == 0 || resultado2 == 0) {
      barraDeFracasso('Erro de conexão, tente novamente mais tarde');
    } else if (resultado1 != 200 && resultado2 != 200) {
      barraDeFracasso(
        'Algo deu errado, tente novamente mais tarde, codigo erro : $resultado1 e $resultado2',
      );
    }
  }

  @override
  void initState() {
    super.initState();
    atualizaInfo();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF130D26),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Image(
                image: AssetImage('assets/img/LogoMaisSombreada.png'),
                height: 250,
                width: 250,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Carregando suas informações...',
              style: TextStyle(
                color: Color(0xFF6E5CFF),
                fontFamily: 'fredoka',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                color: Color(0xFF6E5CFF),
                backgroundColor: Colors.transparent,
                strokeWidth: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
