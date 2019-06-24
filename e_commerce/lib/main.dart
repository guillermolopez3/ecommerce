import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

import 'model/app_state_model.dart';
import 'home.dart';
import 'elegir_categoria.dart';

void main() {
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]
  );

  AppStateModel model = AppStateModel();
  model.loadProducts();
  runApp(
    ScopedModel<AppStateModel>(
        model: model,
        child: Ecommerce())
  );
}

class Ecommerce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profesionales',
      home: ElegirCategoria() ,
    );
  }
}


