import 'package:flutter/material.dart';

class Textfieldsdologin extends StatelessWidget {
  const Textfieldsdologin(
    this.caminhoImg,
    this.altura,
    this.largura,
    this.placeHolder,
    this.eSenha,
    this.temFoto, {
    super.key,
  });

  final String caminhoImg;
  final double altura;
  final double largura;
  final String placeHolder;
  final bool eSenha;
  final bool temFoto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: largura,
      height: altura,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (temFoto)
            Image(
              image: AssetImage(caminhoImg),
              width: 50,
              height: (altura - 5),
            ),
          Container(
            height: (altura),
            width: (largura - 50),
            child: TextField(
              decoration: InputDecoration(
                hintText: placeHolder,
                hintStyle: TextStyle(fontFamily: 'fedroka', fontSize: 14),
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.black, fontFamily: 'fedroka'),
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
