import 'package:flutter/material.dart';

class Textfieldsdouseredit extends StatelessWidget {
  final String texto;
  final bool eSenha;
  final TextEditingController controller;
  final double espaco;

  const Textfieldsdouseredit(
    this.texto,
    this.eSenha,
    this.controller,
    this.espaco, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$texto :",
            style: TextStyle(
              fontFamily: 'fredoka',
              color: Colors.white,
              fontWeight: FontWeight(400),
              fontSize: 16,
            ),
          ),
          SizedBox(width: espaco),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            width: 180,
            child: TextField(
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20),
                border: InputBorder.none,
                hintText: texto,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'fredoka',
                  fontSize: 14,
                ),
              ),
              controller: controller,
              cursorHeight: 15,
              obscureText: eSenha,
            ),
          ),
        ],
      ),
    );
  }
}
