// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthSingleton {
  static final AuthSingleton _singleton = AuthSingleton._internal();
  final _auth = FirebaseAuth.instance;
  
  factory AuthSingleton() {
    return _singleton;
  }

  AuthSingleton._internal();

    Future<void> signIn(BuildContext context, String email, String password, Function onSignInSuccess) async {
    try {
      // ignore: unused_local_variable
      final user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSignInSuccess();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text('Logeo exitoso'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialogError(context, e);
    } catch (e) {
      showDialogError(context, e);
    }
  }
  
  Future<void> signOut() async {
    await _auth.signOut();
  }

  void showDialogError(BuildContext context, dynamic error) {
    String mensajeError;
    if (error is FirebaseAuthException) {
      if (error.code == 'user-not-found') {
        mensajeError = 'No se encontró usuario para ese correo.';
      } else if (error.code == 'wrong-password') {
        mensajeError = 'Contraseña incorrecta proporcionada para ese usuario.';
      } else {
        mensajeError = 'Error: ${error.message}';
      }
    } else {
      mensajeError = 'Error inesperado: ${error.toString()}';
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(mensajeError),
        );
      },
    );
  }
}
