import 'package:flutter/material.dart';

class Textfieldsdologin extends StatelessWidget {
  final double largura;
  final double altura;
  final Icon icone;
  final String placeHolder;
  final bool eSenha;
  final TextEditingController texto;

  const Textfieldsdologin({
    super.key,
    required this.largura,
    required this.altura,
    required this.icone,
    required this.placeHolder,
    required this.eSenha,
    required this.texto,
  });

  String textoDigitado() {
    return texto.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      width: largura,
      height: altura,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icone,
          Container(
            width: (largura - 50),
            child: TextField(
              decoration: InputDecoration(
                hintText: placeHolder,
                hintStyle: TextStyle(fontFamily: 'fredoka', fontSize: 14),
                border: InputBorder.none,
              ),
              controller: texto,
              style: TextStyle(color: Colors.black, fontFamily: 'fredoka'),
              textAlignVertical: TextAlignVertical.top,
              textAlign: TextAlign.start,
              obscureText: eSenha,
            ),
          ),
        ],
      ),
    );
  }
}
