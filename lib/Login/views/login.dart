import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Login/Logic/login_logic.dart';
import 'package:proyecto_final/Login/views/register.dart';
import 'package:proyecto_final/Login/views/login-image.dart';
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
  late StreamSubscription<User?> _authSubscription;

  @override
  void initState() {
    super.initState();
    _authSubscription = _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StartingPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de inicio de sesión'),
        backgroundColor: Colors.green[800],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: LoginImage(),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.green[800]!,
                        Colors.white,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 100.0, left: 100.0, right: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    labelText: 'Usuario',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    labelText: 'Contraseña',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ElevatedButton(
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ElevatedButton(
                          child: const Text('Registrar'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegistroDemo()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
