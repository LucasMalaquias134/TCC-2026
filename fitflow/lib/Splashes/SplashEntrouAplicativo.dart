import 'package:flutter/material.dart';

class Splashentrouaplicativo extends StatefulWidget {
  const Splashentrouaplicativo(this.segs, this.classe, {super.key});

  final int segs;
  final Widget classe;

  @override
  State<Splashentrouaplicativo> createState() => _SplashentrouaplicativoState();
}

class _SplashentrouaplicativoState extends State<Splashentrouaplicativo> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: widget.segs), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => widget.classe),
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
