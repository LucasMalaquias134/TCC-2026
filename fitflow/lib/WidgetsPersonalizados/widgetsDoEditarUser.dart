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
