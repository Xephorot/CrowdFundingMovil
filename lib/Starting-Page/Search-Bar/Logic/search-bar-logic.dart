// ignore_for_file: file_names
import 'package:firebase_database/firebase_database.dart';

class SearchBarLogic {
  final DatabaseReference _ref = FirebaseDatabase.instance.ref('proyectista');

  Future<List> search(String query) async {
    DatabaseEvent event = await _ref.orderByChild('nombre_proyecto').startAt(query).endAt(query + "\uf8ff").once();
    DataSnapshot snapshot = event.snapshot;
    List items = [];
    if (snapshot.value != null) {
      (snapshot.value as Map).forEach((key, value) {
        items.add(value);
      });
    }
    return items;
  }
}

