import 'package:flutter/material.dart';
import 'package:proyecto_final/Login/Buttons/sign_out_button.dart';

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
      body: const customSearchBar.SearchBar(),
    );
  }
}
