// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:proyecto_final/Starting-Page/Search-Bar/search-bar.dart' as customSearchBar;

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      body: customSearchBar.SearchBar(),
    );
  }
}
