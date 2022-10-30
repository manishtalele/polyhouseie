import 'package:firebase_database/firebase_database.dart';

var controlData;
bool loader = true;

DatabaseReference parkingPlaceData = FirebaseDatabase.instance.ref('/Control');

dynamic getData({required Function loader}) async {
  try {
    parkingPlaceData.onValue.listen((DatabaseEvent event) {
      controlData = event.snapshot.value;
      loader();
    });
  } catch (e) {
    print(e.toString());
  }
}
