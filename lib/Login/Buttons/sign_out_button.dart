import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Login/login.dart';

class SignOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginDemo()),
          (route) => false,
        );
      },
      child: Text('Cerrar sesión'),
    );
  }
}
