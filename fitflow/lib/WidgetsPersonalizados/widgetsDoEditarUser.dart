import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class cartaoPadrao extends StatelessWidget {
  const cartaoPadrao({
    required this.icone,
    required this.titulo,
    required this.titulo2,
    super.key,
  });
  final IconData icone;
  final String titulo;
  final String titulo2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icone, color: Colors.white, size: 20),
        SizedBox(width: 5),
        Container(
          width: 130,
          child: Text(
            titulo,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'fredoka',
              fontSize: 15,
            ),
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Expanded(
          child: Text(
            titulo2,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'fredoka',
              fontSize: 15,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

//===========================================================================================

class cartaoNavigator extends StatelessWidget {
  final IconData icone;
  final Widget classe;
  final String titulo;
  const cartaoNavigator({
    required this.icone,
    required this.classe,
    required this.titulo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => classe),
              );
            },
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: .center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(icone, color: Colors.white, size: 20),
                        SizedBox(width: 5),
                        Container(
                          child: Text(
                            '$titulo (web View)',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'fredoka',
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              elevation: 4,
              color: Color(0xFF2E2C54),
              margin: EdgeInsets.all(10),
            ),
          ),
        ),
      ],
    );
  }
}

//===========================================================================================

class TextfieldPesquisar extends StatelessWidget {
  final double? largura;
  final IconData? icone;
  final String placeHolder;
  final String? placeHolder2;
  final bool? eSenha;
  final TextEditingController controller;
  final bool? numerico;
  final String? Function(String?)? validador;
  final Function(String?)? enviado;
  final bool? labelFlutante;
  final bool? temaEscuro;
  final bool? temRadius;
  final double? radius;
  final Color? backgroundCor;

  const TextfieldPesquisar({
    super.key,
    this.largura,
    this.icone,
    required this.placeHolder,
    this.placeHolder2,
    this.eSenha,
    this.numerico,
    required this.controller,
    this.validador,
    this.enviado,
    this.labelFlutante,
    this.temaEscuro,
    this.temRadius,
    this.radius,
    this.backgroundCor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: largura,
      color: Colors.transparent,
      child: numerico == true
          ? TextFormField(
              onFieldSubmitted: enviado,
              validator: validador,
              style: TextStyle(
                color: temaEscuro == true ? Colors.black : Colors.white,

                fontSize: 14,
              ),
              decoration: InputDecoration(
                filled: (backgroundCor != null) ? true : false,
                fillColor: (backgroundCor != null)
                    ? backgroundCor
                    : Colors.transparent,
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

                  fontSize: 18,
                ),
                hintText: placeHolder2 != null ? placeHolder2 : placeHolder,
                hintStyle: TextStyle(
                  color: temaEscuro == true
                      ? Colors.black.withValues(alpha: 0.4)
                      : Colors.white.withValues(alpha: 0.4),

                  fontSize: 14,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: temRadius == true
                      ? BorderRadius.circular(radius!)
                      : BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.indigo),
                ),
                border: OutlineInputBorder(
                  borderRadius: temRadius == true
                      ? BorderRadius.circular(radius!)
                      : BorderRadius.circular(15),
                ),
              ),
              cursorColor: Colors.indigo,
              keyboardType: const TextInputType.numberWithOptions(
                signed: true,
                decimal: false,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[0-9\-+]*$')),
              ],
              obscureText: eSenha == null ? false : true,
              controller: controller,
            )
          : TextFormField(
              onFieldSubmitted: enviado,
              validator: validador,
              style: TextStyle(
                color: temaEscuro == true ? Colors.black : Colors.white,

                fontSize: 14,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white.withValues(alpha: 0.15),
                    width: 1.0,
                  ),
                  borderRadius: temRadius == true
                      ? BorderRadius.circular(radius!)
                      : BorderRadius.circular(15),
                ),
                filled: (backgroundCor != null) ? true : false,
                fillColor: (backgroundCor != null)
                    ? backgroundCor
                    : Colors.transparent,
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

                  fontSize: 18,
                ),
                hintText: placeHolder2 != null ? placeHolder2 : placeHolder,
                hintStyle: TextStyle(
                  color: temaEscuro == true
                      ? Colors.black.withValues(alpha: 0.4)
                      : Colors.white.withValues(alpha: 0.4),

                  fontSize: 14,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: temRadius == true
                      ? BorderRadius.circular(radius!)
                      : BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.indigo),
                ),
                border: OutlineInputBorder(
                  borderRadius: temRadius == true
                      ? BorderRadius.circular(radius!)
                      : BorderRadius.circular(15),
                ),
              ),
              cursorColor: Colors.indigo,
              obscureText: eSenha == null ? false : true,
              controller: controller,
            ),
    );
  }
}
