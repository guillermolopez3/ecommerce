import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model/app_state_model.dart';

const _leftColumnWith = 60.0;

class Carrito extends StatefulWidget {
  @override
  _CarritoState createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CARRITO'),
      ),
      body: Container(
        child: ScopedModelDescendant<AppStateModel>(
            builder: (context,child,model){
              return Stack(
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      SizedBox(
                        width: _leftColumnWith,
                        child: Text(
                          'CARRITO'
                        ),
                      )
                    ],
                  )
                ],
              );
            }
        ),
      ),
    );
  }
}
