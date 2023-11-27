import 'package:flutter/material.dart';
import 'package:proyecto_final/Starting-Page/Information-Cards/Buttons/references_logic.dart';
import 'package:proyecto_final/Starting-Page/Map-Screen/map-view.dart';

void showFullInformation(BuildContext context, Map proyectistaData) {
  final referencesLogic = ReferencesLogic();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(proyectistaData['nombre_proyecto']),
            content: SingleChildScrollView(
              child: ListBody(
                children: referencesLogic.filterEntries(proyectistaData),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(referencesLogic.showReferences ? 'Volver' : 'Referencias'),
                onPressed: () {
                  setState(() {
                    referencesLogic.toggleReferences();
                  });
                },
              ),
              TextButton(
                child: const Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Ver en mapa'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapView(coordinates: proyectistaData['coordenadas']),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    },
  );
}


