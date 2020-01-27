import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  Principal({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  Color colorPrincipal = Colors.blue;

  List<MaterialColor> misColores = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey
  ];

  void actualizarColoresTab(int index) {
    for (int i = 0; i < misColores.length; i++) {
      if (i != index) {
        misColores[i] = Colors.grey;
      }
    }
  }

  List<Icon> misIconos1 = [
    Icon(
      Icons.check_circle,
      size: 40,
      color: Colors.orangeAccent.withAlpha(150),
    ),
    Icon(
      Icons.check_circle,
      size: 40,
      color: Colors.orangeAccent.withAlpha(150),
    ),
    Icon(
      Icons.check_circle,
      size: 40,
      color: Colors.orangeAccent.withAlpha(150),
    ),
    Icon(
      Icons.check_circle,
      size: 40,
      color: Colors.orangeAccent.withAlpha(150),
    ),
  ];

  List<Icon> misIconos2 = [
    Icon(
      Icons.check_circle,
      size: 40,
      color: Colors.blue.withAlpha(150),
    ),
    Icon(
      Icons.check_circle,
      size: 40,
      color: Colors.blue.withAlpha(150),
    ),
    Icon(
      Icons.check_circle,
      size: 40,
      color: Colors.blue.withAlpha(150),
    ),
    Icon(
      Icons.check_circle,
      size: 40,
      color: Colors.blue.withAlpha(150),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Entrenamientos diarios',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w700),
              ),
              Text('Entrena diario para obtener mejores resultados'),
              Tarjeta(
                titulo: 'Atención & Control',
                desc: '¡Ejercicios diarios!',
                miColor: Color(0xfffff4db),
                hijo: Row(
                  children: misIconos1,
                ),
              ),
              Tarjeta(
                titulo: 'Matemáticas & Cálculo',
                desc: '¡Practica facilmente!',
                hijo: Row(
                  children: misIconos2,
                ),
                miColor: Colors.blueAccent.withAlpha(50),
              ),
              Tarjeta(
                titulo: 'Mejora tu cerebro',
                desc: '¡Fortalece tus habilidades!',
                hijo: Row(
                  children: misIconos2,
                ),
                miColor: Colors.greenAccent.withAlpha(50),
              ),
              GestureDetector(
                onTap: () {
                  print("Hola");
                },
                child: Container(
                  child: Text(
                    "Sigamos practicando",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.only(
                      left: 100, right: 100, top: 10, bottom: 10),
                ),
              ),
              Center(
                child: ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    BotonPestania(
                      nombre: "Principal",
                      miIcono: Icon(
                        CupertinoIcons.home,
                        color: misColores[0],
                        size: 45,
                      ),
                      alPresionar: () {
                        setState(() {
                          misColores[0] = Colors.red;
                          actualizarColoresTab(0);
                          print("Vaya vaya");
                        });
                      },
                    ),
                    BotonPestania(
                      nombre: "Progreso",
                      miIcono: Icon(
                        CupertinoIcons.person_add,
                        color: misColores[1],
                        size: 45,
                      ),
                      alPresionar: () {
                        setState(() {
                          misColores[1] = Colors.red;
                          actualizarColoresTab(1);
                          print("Vaya vaya");
                        });
                      },
                    ),
                    BotonPestania(
                      nombre: "Entrenamientos",
                      miIcono: Icon(
                        CupertinoIcons.game_controller,
                        color: misColores[2],
                        size: 45,
                      ),
                      alPresionar: () {
                        setState(() {
                          misColores[2] = Colors.red;
                          actualizarColoresTab(2);
                          print("Vaya vaya");
                        });
                      },
                    ),
                    BotonPestania(
                      nombre: "Perfíl",
                      miIcono: Icon(
                        CupertinoIcons.profile_circled,
                        color: misColores[3],
                        size: 45,
                      ),
                      alPresionar: () {
                        setState(() {
                          misColores[3] = Colors.red;
                          actualizarColoresTab(3);
                          print("Vaya vaya");
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Tarjeta extends StatelessWidget {
  Tarjeta({this.titulo, this.desc, this.hijo, this.imagen, this.miColor});

  final String titulo;
  final String desc;
  final Widget hijo;
  final Icon imagen;
  final Color miColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: miColor,
          boxShadow: [
            BoxShadow(
                color: miColor,
                blurRadius: 10.0,
                spreadRadius: 10.0,
                offset: Offset(10, 10))
          ]),
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20,
        top: 5,
        bottom: 5,
      ),
      padding: EdgeInsets.only(top: 12, left: 20, bottom: 5),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                titulo,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 8,
              ),
              Text(desc),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: hijo,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Icon(
              Icons.library_add,
              size: 60,
              color: Colors.orangeAccent,
            ),
          ),
        ],
      ),
    );
  }
}

class BotonPestania extends StatelessWidget {
  BotonPestania({this.miIcono, this.nombre, this.alPresionar});

  final String nombre;
  final Icon miIcono;
  final Function alPresionar;

  Color miColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
            onTap: () {
              alPresionar();
            },
            child: miIcono),
        Text(nombre)
      ],
    );
  }
}
