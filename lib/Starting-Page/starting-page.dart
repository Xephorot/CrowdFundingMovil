// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:proyecto_final/Login/Buttons/sign_out_button.dart';
import 'package:proyecto_final/Starting-Page/Information-Cards/information-cards.dart';

// ignore: library_prefixes
import 'package:proyecto_final/Starting-Page/Search-Bar/search-bar.dart' as customSearchBar;

class StartingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de inicio'),
        actions: const <Widget>[
          SignOutButton(),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: const customSearchBar.SearchBar(),
          ),
          Expanded(
            flex: 10,
            child: const InformationCards(),
          ),
        ],
      ),
    );
  }
}






