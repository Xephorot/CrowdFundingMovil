import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Login/Logic/login_logic.dart';
import 'package:proyecto_final/Login/register.dart';
import 'package:proyecto_final/Starting-Page/starting-page.dart';

class LoginDemo extends StatefulWidget {
  const LoginDemo({super.key});

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StartingPage()),
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de inicio de sesión'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Usuario',
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Contraseña',
            ),
            obscureText: true,
          ),
          FloatingActionButton(
            onPressed: () async {
              await AuthSingleton().signIn(
                context, 
                _emailController.text,
                _passwordController.text,
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => StartingPage()),
                ),
              );
            },
            child: const Text('Iniciar sesión'),
          ),
          FloatingActionButton(
            child: const Text('Registrar'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegistroDemo()),
              );
            },
          ),
        ],
      ),
    );
  }
}
