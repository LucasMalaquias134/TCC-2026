import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Textfieldsdologin extends StatelessWidget {
  final double? largura;
  final IconData? icone;
  final String placeHolder;
  final String? placeHolder2;
  final bool? eSenha;
  final TextEditingController controller;
  final bool? numerico;
  final String? Function(String?)? validador;
  final bool? labelFlutante;
  final bool? temaEscuro;
  final bool? temRadius;
  final double? radius;

  const Textfieldsdologin({
    super.key,
    this.largura,
    this.icone,
    required this.placeHolder,
    this.placeHolder2,
    this.eSenha,
    this.numerico,
    required this.controller,
    this.validador,
    this.labelFlutante,
    this.temaEscuro,
    this.temRadius,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: largura,
      color: Colors.transparent,
      child: numerico == true
          ? TextFormField(
              validator: validador,
              style: TextStyle(
                color: temaEscuro == true ? Colors.black : Colors.white,
                fontFamily: 'fredoka',
                fontSize: 14,
              ),
              decoration: InputDecoration(
                floatingLabelBehavior: labelFlutante == true
                    ? FloatingLabelBehavior.always
                    : null,
                prefixIcon: icone != null
                    ? Icon(
                        icone,
                        color: temaEscuro == true ? Colors.black : Colors.white,
                      )
                    : null,
                labelText: placeHolder,
                labelStyle: TextStyle(
                  color: temaEscuro == true
                      ? Colors.black.withValues(alpha: 0.7)
                      : Colors.white,
                  fontFamily: 'fredoka',
                  fontSize: 18,
                ),
                hintText: placeHolder2 != null ? placeHolder2 : placeHolder,
                hintStyle: TextStyle(
                  color: temaEscuro == true
                      ? Colors.black.withValues(alpha: 0.4)
                      : Colors.white.withValues(alpha: 0.4),
                  fontFamily: 'fredoka',
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: temRadius == true
                      ? BorderRadius.circular(radius!)
                      : BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: temRadius == true
                      ? BorderRadius.circular(radius!)
                      : BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.indigo),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              obscureText: eSenha == null ? false : true,
              controller: controller,
            )
          : TextFormField(
              validator: validador,
              style: TextStyle(
                color: temaEscuro == true ? Colors.black : Colors.white,
                fontFamily: 'fredoka',
                fontSize: 14,
              ),
              decoration: InputDecoration(
                floatingLabelBehavior: labelFlutante == true
                    ? FloatingLabelBehavior.always
                    : null,
                prefixIcon: icone != null
                    ? Icon(
                        icone,
                        color: temaEscuro == true ? Colors.black : Colors.white,
                      )
                    : null,
                labelText: placeHolder,
                labelStyle: TextStyle(
                  color: temaEscuro == true
                      ? Colors.black.withValues(alpha: 0.7)
                      : Colors.white,
                  fontFamily: 'fredoka',
                  fontSize: 18,
                ),
                hintText: placeHolder2 != null ? placeHolder2 : placeHolder,
                hintStyle: TextStyle(
                  color: temaEscuro == true
                      ? Colors.black.withValues(alpha: 0.4)
                      : Colors.white.withValues(alpha: 0.4),
                  fontFamily: 'fredoka',
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: temRadius == true
                      ? BorderRadius.circular(radius!)
                      : BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: temRadius == true
                      ? BorderRadius.circular(radius!)
                      : BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.indigo),
                ),
              ),
              cursorColor: Colors.indigo,
              obscureText: eSenha == null ? false : true,
              controller: controller,
            ),
    );
  }
}
