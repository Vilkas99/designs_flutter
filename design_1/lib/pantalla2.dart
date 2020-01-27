import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PantallaSeleccion extends StatefulWidget {
  @override
  _PantallaSeleccionState createState() => _PantallaSeleccionState();
}

class _PantallaSeleccionState extends State<PantallaSeleccion> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BrochaArena(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * .3),
                child: Text(
                  "ESCOGE",
                  style: TextStyle(
                      color: Color(0xFFE9D0A0),
                      fontFamily: "RobotoSlab",
                      fontSize: MediaQuery.of(context).size.width * .08,
                      letterSpacing: 20),
                ),
              ),
              Text(
                "4",
                style: TextStyle(
                    color: Color(0xFFBEA573),
                    fontFamily: "RobotoSlab",
                    fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width * .1),
              ),
              Text(
                "CARRERAS",
                style: TextStyle(
                    color: Color(0xFFBEA573),
                    fontFamily: "RobotoSlab",
                    fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width * .1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ContenerCategoria(
                        multiHeight: .20,
                        multiWidth: .3,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .03,
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      ContenerCategoria(
                        multiHeight: .28,
                        multiWidth: .40,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).size.width * .20),
                      ContenerCategoria(
                        multiHeight: .28,
                        multiWidth: .40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .05,
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      ContenerCategoria(
                        multiHeight: .25,
                        multiWidth: .3,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class BrochaArena extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final altura = size.height;
    final ancho = size.width;

    Paint brocha = Paint();
    Path fondo = Path();

    fondo.addRect(Rect.fromLTRB(0, 0, ancho, altura));
    brocha.color = Color(0xFFFFDE9D);
    canvas.drawPath(fondo, brocha);

    //Articulo que me salvo la vida: https://blog.usejournal.com/how-to-draw-custom-shapes-in-flutter-aa197bda94bf

    //Otro buen artículo:  https://medium.com/devmins/flutter-custom-paint-tutorial-draw-a-custom-shape-path-in-flutter-afbbf0202941

    Path path = Path();
    path.moveTo(0, altura * .4);
    //path.lineTo(0, size.height * 0.30);
    path.cubicTo(0, altura * .1, ancho * .7, altura * .4, ancho, altura * .15);
    path.lineTo(ancho, 0);
    path.lineTo(0, 0);
    path.close();
    brocha.color = Colors.white;
    canvas.drawPath(path, brocha);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != null;
  }
}

class ContenerCategoria extends StatelessWidget {
  ContenerCategoria({this.multiHeight, this.multiWidth});

  final multiWidth;
  final multiHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * multiWidth,
      height: MediaQuery.of(context).size.height * multiHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 180),
                blurRadius: 20.0,
                spreadRadius: 0,
                offset: Offset(10, 12))
          ]),
      child: Center(
        child: RawMaterialButton(
          child: Icon(
            Icons.home,
            size: 45,
          ),
          shape: ,
          elevation: 2.0,
          fillColor: Colors.greenAccent,
          padding: EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}
