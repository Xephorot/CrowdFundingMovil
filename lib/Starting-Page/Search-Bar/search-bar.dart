import 'package:flutter/material.dart';
import 'package:proyecto_final/Starting-Page/Search-Bar/Logic/search-bar-logic.dart';
import 'package:proyecto_final/Starting-Page/Information-Cards/Buttons/full-information.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final SearchBarLogic _searchBarLogic = SearchBarLogic();
  final TextEditingController _controller = TextEditingController();
  List _items = [];

  void _search() async {
    List items = await _searchBarLogic.search(_controller.text);
    setState(() {
      _items = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Buscar',
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: _search,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(_items[index]['nombre_proyecto']),
                  subtitle: Text(_items[index]['nombre_completo']),
                  onTap: () => showFullInformation(context, _items[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.monetization_on),
                    onPressed: () {
                      launch('https://www.google.com');
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
