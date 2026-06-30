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
class textfieldsDoEditarUser extends StatelessWidget {
  final String titulo;
  final TextEditingController controller;
  final bool numerico;
  const textfieldsDoEditarUser({
    required this.controller,
    required this.titulo,
    required this.numerico,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF4E4B7C),
        ),
        child: numerico
            ? TextField(
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'fredoka',
                  fontSize: 24,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(left: 10, top: 0, bottom: 0),
                  border: InputBorder.none,
                  hintText: titulo,
                  hintStyle: TextStyle(
                    color: Colors.white.withValues(alpha: 0.5),
                    fontFamily: 'fredoka',
                    fontSize: 24,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: controller,
              )
            : TextField(
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'fredoka',
                  fontSize: 24,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(left: 10, top: 0, bottom: 0),
                  border: InputBorder.none,
                  hintText: titulo,
                  hintStyle: TextStyle(
                    color: Colors.white.withValues(alpha: 0.5),
                    fontFamily: 'fredoka',
                    fontSize: 24,
                  ),
                ),
                controller: controller,
              ),
      ),
    );
  }
}

//===========================================================================================
