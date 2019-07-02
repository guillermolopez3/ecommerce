import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/login.dart';
import 'utils/routes.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'bloc/user_bloc.dart';

void main() {
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]
  );

  runApp(Ecommerce());
}

class Ecommerce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Profesionales',
          home: LogIn(),
          onGenerateRoute: Routes.generarRutas,
        ),
        bloc: UserBloc()
    );
  }
}


