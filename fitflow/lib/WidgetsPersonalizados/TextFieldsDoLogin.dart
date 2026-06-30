import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Textfieldsdologin extends StatelessWidget {
  final double largura;
  final double altura;
  final Icon? icone;
  final String placeHolder;
  final bool eSenha;
  final TextEditingController texto;
  final bool numerico;

  const Textfieldsdologin({
    super.key,
    required this.largura,
    required this.altura,
    this.icone,
    required this.placeHolder,
    required this.eSenha,
    required this.texto,
    required this.numerico,
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
          if (icone != null) icone!,
          Container(
            width: (largura - 50),
            child: numerico
                ? TextField(
                    decoration: InputDecoration(
                      hintText: placeHolder,
                      hintStyle: TextStyle(fontFamily: 'fredoka', fontSize: 14),
                      border: InputBorder.none,
                    ),
                    controller: texto,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'fredoka',
                    ),
                    textAlignVertical: TextAlignVertical.top,
                    textAlign: TextAlign.start,
                    obscureText: eSenha,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  )
                : TextField(
                    decoration: InputDecoration(
                      hintText: placeHolder,
                      hintStyle: TextStyle(fontFamily: 'fredoka', fontSize: 14),
                      border: InputBorder.none,
                    ),
                    controller: texto,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'fredoka',
                    ),
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
