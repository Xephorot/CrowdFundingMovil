import 'package:flutter/material.dart';
import 'package:proyecto_final/Starting-Page/Information-Cards/Buttons/references_logic.dart';
import 'package:proyecto_final/Starting-Page/Map-Screen/map-view.dart';
import 'package:url_launcher/url_launcher.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                    child: Text(referencesLogic.showReferences ? 'Llamar' : 'Ver en mapa'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (referencesLogic.showReferences) {
                        // ignore: deprecated_member_use
                        launch('tel:${proyectistaData['tel']}');
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapView(coordinates: proyectistaData['coordenadas']),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          );
        },
      );
    },
  );
}
