// ignore_for_file: file_names
import 'package:firebase_database/firebase_database.dart';

class InformationCardsLogic {
  final DatabaseReference _ref = FirebaseDatabase.instance.ref('proyectista');

  Future<List> getProyectistas() async {
    DatabaseEvent event = await _ref.once();
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
