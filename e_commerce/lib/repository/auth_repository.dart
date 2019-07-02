import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth_api.dart';

//tiene la logica de hacer la utenticacion independientemente de cual sea la conexion a la BD

class AuthRepository
{
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signIn();
}