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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (){
              _showDialog(context);
            },
          )
        ],
      ),
      body: _body(),
    );
  }

  void _showDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (context){
          return AlertDialog(
            title: Text('Denunciar Perfil'),
            content: TextField(
              decoration: InputDecoration(
                hintText: 'Motivo de la denuncia'
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Enviar', style: TextStyle(color: Colors.black)),
                onPressed: ()=>Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('Cancelar', style: TextStyle(color: Colors.black)),
                onPressed: ()=> Navigator.of(context).pop(),

              )
            ],
          );
      }
    );

  }

  Widget _body(){
    return ListView(
      children: <Widget>[
        _cabecera(),
        _infoPerfil(),
        _webUbicacion(),
        _detalleServicio()
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
          ),
        ],
      ),
    );
  }

  //datos debajo de la cabecera
  Widget _infoPerfil(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 8,),
          Text(
            'Plomero, Gasista, Electricista matriculado',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(height: 8.0),
          RichText(
            maxLines: 3,
            text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Zonas trabajo: ',
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'Argüello, Rio Ceballos'),
                ]
            ),
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
          onPressed: (){},
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

  //direccion y web
  Widget _webUbicacion()=> Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      FlatButton(
        onPressed: (){},
        child: Row(
          children: <Widget>[
            Icon(Icons.location_on),
            Text('Dirección')
          ],
        ),
        shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
      ),
      FlatButton(
        onPressed: (){},
        child: Row(
          children: <Widget>[
            Icon(Icons.language),
            Text('Página')
          ],
        ),
        shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
      )
    ],
  );

  Widget _detalleServicio(){
    return Padding(
      padding: const EdgeInsets.only(left:10.0, right: 10.0, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Descripción de los servicios', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
          SizedBox(height: 10,),
          Card(
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                style: TextStyle(
                  letterSpacing: 2,

                ),
                textAlign: TextAlign.justify,
              ),
            ),
          )
        ],
      ),
    );
  }
}


