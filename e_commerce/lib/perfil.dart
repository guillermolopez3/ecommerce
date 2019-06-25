import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  final String name;
  final int nroHero;

  Perfil({this.name, this.nroHero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          name,
          style: TextStyle(
              color: Colors.black
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: _body(),
    );
  }

  Widget _body(){
    return ListView(
      children: <Widget>[
        _cabecera()
      ],
    );
  }

  Widget _cabecera(){
    return Container(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Hero(
              tag: nroHero,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/img/perfil.jpg',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: _contacto(),
          )
        ],
      ),
    );
  }

  //Columna con los nros del perfil mas el boton de contacto
  Widget _contacto(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _nrosPerfil('4.5', 'Calificación'),
            SizedBox(width: 10,),
            _nrosPerfil('48', 'Contactos')
          ],
        ),
        SizedBox(height: 5),
        FlatButton(
          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Text('CONTACTAR'),
        )
      ],
    );
  }

  //Muestro el nro de calificacion y de contactos
  Widget _nrosPerfil(String nro, String detalle){
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Column(
        children: <Widget>[
          Text(
            nro,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          Text(
            detalle,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          )
        ],
      ),
    );
  }
}
