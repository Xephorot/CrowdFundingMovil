import 'package:flutter/material.dart';
import 'package:proyecto_final/Login/Buttons/sign_out_button.dart';
import 'package:proyecto_final/Starting-Page/Information-Cards/information-cards.dart';
import 'package:proyecto_final/Starting-Page/Search-Bar/search_page.dart';
import 'package:proyecto_final/Starting-Page/nav_bar.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  int _currentIndex = 0;
  final _pages = [
    const InformationCards(),
    const SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de inicio'),
        actions: const <Widget>[
          SignOutButton(),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: NavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}