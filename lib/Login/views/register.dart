// ignore_for_file: use_build_context_synchronously, unused_local_variable
import 'package:flutter/material.dart';

//Importaciones de Flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_final/Login/views/login.dart';

class RegistroDemo extends StatefulWidget {
  const RegistroDemo({super.key});

  @override
  _RegistroDemoState createState() => _RegistroDemoState();
}

class _RegistroDemoState extends State<RegistroDemo> {
  final _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de registro'),
        backgroundColor: Colors.green[800],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Correo electrónico',
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
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirmar contraseña',
              ),
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Registrarse'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () async {
                    try {
                      final user = await _auth.createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Registro Exitoso'),
                            actions: <Widget>[
                              ElevatedButton(
                                child: Text('Ok'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green[800],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushReplacementNamed('/main');
                                },
                                
                              ),
                            ],
                          );
                        },
                      );
                    } catch (e) {
                      // Aquí va el código para manejar los errores de registro
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('No se pudo registrar al usuario'),
                            actions: <Widget>[
                              ElevatedButton(
                                child: Text('Ok'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green[800],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
                ElevatedButton(
                  child: const Text('Iniciar sesión'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginDemo()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
