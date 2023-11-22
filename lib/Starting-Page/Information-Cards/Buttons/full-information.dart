import 'package:flutter/material.dart';
import 'package:proyecto_final/Starting-Page/Map-Screen/map-view.dart';

void showFullInformation(BuildContext context, Map proyectistaData) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(proyectistaData['nombre_proyecto']),
        content: SingleChildScrollView(
          child: ListBody(
            children: proyectistaData.entries.map((entry) {
              return Text('${entry.key}: ${entry.value}');
            }).toList(),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cerrar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Ver en mapa'),
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
}
