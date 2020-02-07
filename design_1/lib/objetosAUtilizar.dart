import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pantalla2.dart';

class PantallaObjetos extends StatefulWidget {
  @override
  _PantallaObjetosState createState() => _PantallaObjetosState();
}

class _PantallaObjetosState extends State<PantallaObjetos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: MenuDashboardPage(
            objetos: PantallaSeleccion(),
          ),
        ));
  }
}

class CajaTemaDescripcion extends StatelessWidget {
  CajaTemaDescripcion(
      {this.sizeDesc: 17.0,
      this.sizeTitulo: 40.0,
      this.titulo: "Titulo",
      this.desc: "Descripcion",
      this.colorTitulo: Colors.black});

  final sizeDesc;
  final sizeTitulo;

  final titulo;
  final desc;

  final colorTitulo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * .9, //.9 default
        height: MediaQuery.of(context).size.height * .2, //.2 default
        padding: EdgeInsets.only(top: 25),
        child: Column(
          children: <Widget>[
            Text(
              desc,
              style: TextStyle(fontSize: sizeDesc),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              titulo,
              style: TextStyle(
                  fontSize: sizeTitulo,
                  letterSpacing: 3,
                  fontFamily: 'MPLUS',
                  fontWeight: FontWeight.w700,
                  color: colorTitulo),
            )
          ],
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black38, offset: Offset(5, 10), blurRadius: 10)
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

class CajaProblema extends StatelessWidget {
  CajaProblema({this.colorTarjeta});

  final colorTarjeta;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          //Sombra 1
          Container(
            width: MediaQuery.of(context).size.width * .6,
            height: MediaQuery.of(context).size.height * .49,
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Color(0xff737272),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40)),
            ),
          ),

          //Sombra 2
          Container(
            width: MediaQuery.of(context).size.width * .6,
            height: MediaQuery.of(context).size.height * .475,
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40)),
            ),
          ),

          //Tarjeta principal
          Container(
            width: MediaQuery.of(context).size.width * .6,
            height: MediaQuery.of(context).size.height * .45,
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 10, blurRadius: 30)
                ]),
            child: Column(
              children: <Widget>[
                //Contenedor para el titulo
                Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    decoration: null,
                    textAlign: TextAlign.center,
                    maxLength: 150,
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'MPLUS',
                        fontWeight: FontWeight.w700),
                  ),
                ),

                //Línea que separa el titulo del texto
                Container(
                  width: 120,
                  child: Divider(
                    color: colorTarjeta,
                    thickness: 1,
                  ),
                ),
                //Contenedor para la descripción
                Container(
                  width: MediaQuery.of(context).size.width * .5,
                  height: MediaQuery.of(context).size.height * .32,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color: colorTarjeta),
                      borderRadius: BorderRadius.circular(30)),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 9,
                    decoration: null,
                    maxLength: 150,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InputOvalado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * .35,
        height: MediaQuery.of(context).size.height * .04,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            border: Border.all(color: Colors.white, width: 1)),
        child: TextField(
          decoration: null,
          textAlign: TextAlign.center,
          maxLength: 15,
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'MPLUS',
              fontWeight: FontWeight.w700,
              color: Colors.white),
          //TODO: Colocar funcion que utilice lo que haya colocado el usuario.
          onSubmitted: (nuevoValor) {
            print(nuevoValor);
          },
        ),
      ),
    );
  }
}

class BotonRegresar extends StatelessWidget {
  BotonRegresar({this.colorBtn: Colors.white});
  final colorBtn;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 45)]),
        width: 40,
        child: RawMaterialButton(
          fillColor: colorBtn,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          child: Icon(
            Icons.arrow_back,
            size: 40,
          ),
        ),
      ),
    );
  }
}

//Clase que nos permite generar la pantalla con los botones de menu funcionales
class MenuDashboardPage extends StatefulWidget {
  //Toma los objetos (Widgets) que desplegará en pantalla.
  final objetos;
  MenuDashboardPage({this.objetos});

  @override
  _MenuDashboardPageState createState() =>
      _MenuDashboardPageState(objetos: objetos);
}

class _MenuDashboardPageState extends State<MenuDashboardPage> {
  final objetos;
  _MenuDashboardPageState({this.objetos});

  //Booleano que me indica si el menu está escondido
  bool escondido = true;
  double anchoPantalla, alturaPantalla;
  //Duración de la animación de desplazamiento
  final Duration duracion = const Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    //Obtenemos el tamaño de la pantalla.
    Size tamanio = MediaQuery.of(context).size;
    anchoPantalla = tamanio.width;
    alturaPantalla = tamanio.height;

    return Scaffold(
      backgroundColor: escondido ? Colors.grey : Colors.black,
      body: Stack(
        children: <Widget>[
          //Menu que se mostrará al presionar el botón.
          menu(context),
          //Dashborado que contendrá todos los obejtos de la pantalla en cuestión
          dashboard(context, objetos),
        ],
      ),
    );
  }

  //Widget que posee el menu a desplegar
  Widget menu(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Conjunto de textos que fungen como 'botones' para desplazarse a otra página'
            GestureDetector(
              child: Text(
                "Perfíl",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                //TODO: Colocar el navigator para la pantalla a viajar.
              },
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: Text(
                "Perfíl",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                //TODO: Colocar el navigator para la pantalla a viajar.
              },
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: Text(
                "Perfíl",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                //TODO: Colocar el navigator para la pantalla a viajar.
              },
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: Text(
                "Perfíl",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                //TODO: Colocar el navigator para la pantalla a viajar.
              },
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: Text(
                "Perfíl",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                //TODO: Colocar el navigator para la pantalla a viajar.
              },
            ),
          ],
        ),
      ),
    );
  }

  //Widget que posee el espacio para color los objetos a conformar de la pantalla.
  Widget dashboard(context, objetos) {
    //Tenmos una posición animada.
    return AnimatedPositioned(
      duration: duracion,
      //Si el menu está escondido, todas sus posiciones erán 0
      //Si no, se desplazará a un valor numerico multplicado por el ancho o alto de la pantalla.
      top: escondido ? 0 : 0.2 * alturaPantalla,
      bottom: escondido ? 0 : 0.2 * anchoPantalla,
      left: escondido ? 0 : 0.6 * anchoPantalla,
      right: escondido ? 0 : -0.4 * anchoPantalla,
      child: Material(
        animationDuration: duracion,
        borderRadius: BorderRadius.all(Radius.circular(40)),
        elevation: escondido ? 0 : 20,
        color: Colors.grey,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              //Si los objetos que tenemos como argumento no son nulos, entonces colocamos un SizedBox
              (objetos != null) ? objetos : SizedBox(),
              //Depsués añadimos un padding, que tendrá el botón de menu
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                      //Al ser tocado...
                      onTap: () {
                        setState(
                          () {
                            //Cambiará el estado de mi valor booleano.
                            escondido = !escondido;
                          },
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
