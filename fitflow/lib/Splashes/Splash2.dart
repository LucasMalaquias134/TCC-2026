import 'package:fitflow/Pages/Home.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:flutter/material.dart';

class Splash2 extends StatefulWidget {
  const Splash2(this.segs, this.usuario, {super.key});

  final int segs;
  final User usuario;

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: widget.segs), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home(usuario: widget.usuario)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C0B2B),
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
            SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                color: Colors.white,
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
