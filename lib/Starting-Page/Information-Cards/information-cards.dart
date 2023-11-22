import 'package:flutter/material.dart';
import 'package:proyecto_final/Starting-Page/Information-Cards/Logic/information-cards-logic.dart';
import 'package:proyecto_final/Starting-Page/Information-Cards/Buttons/full-information.dart';

class InformationCards extends StatefulWidget {
  const InformationCards({super.key});

  @override
  _InformationCardsState createState() => _InformationCardsState();
}

class _InformationCardsState extends State<InformationCards> {
  final InformationCardsLogic _informationCardsLogic = InformationCardsLogic();
  List _items = [];

  @override
  void initState() {
    super.initState();
    _getProyectistas();
  }

  void _getProyectistas() async {
    List items = await _informationCardsLogic.getProyectistas();
    setState(() {
      _items = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(_items[index]['nombre_proyecto']),
            subtitle: Text(_items[index]['nombre_completo']),
            onTap: () => showFullInformation(context, _items[index]),
          ),
        );
      },
    );
  }
}
