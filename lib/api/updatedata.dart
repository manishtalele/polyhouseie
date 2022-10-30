import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:polyhouseie/api/getdata.dart';

CollectionReference users = FirebaseFirestore.instance.collection('polyhouse');

updateRoofs() async {
  Map<String, Object?> updates = {};
  if (controlData["Roof1"] && controlData["Roof2"]) {
    updates["Control/Roof1"] = !controlData["Roof1"];
    updates["Control/Roof2"] = !controlData["Roof2"];

    return FirebaseDatabase.instance.ref().update(updates);
  } else if (controlData["Roof2"] || controlData["Roof1"]) {
    updates["Control/Roof1"] = true;
    updates["Control/Roof2"] = true;

    return FirebaseDatabase.instance.ref().update(updates);
  } else if (!controlData["Roof1"] && !controlData["Roof2"]) {
    updates["Control/Roof1"] = true;
    updates["Control/Roof2"] = true;

    return FirebaseDatabase.instance.ref().update(updates);
  } else {
    updates["Control/Roof1"] = false;
    updates["Control/Roof2"] = false;

    return FirebaseDatabase.instance.ref().update(updates);
  }
}

updatePumps() async {
  Map<String, Object?> updates = {};
  if (controlData["Waterpump1"] && controlData["Waterpump2"]) {
    updates["Control/Waterpump1"] = !controlData["Waterpump1"];
    updates["Control/Waterpump2"] = !controlData["Waterpump2"];

    return FirebaseDatabase.instance.ref().update(updates);
  } else if (controlData["Waterpump2"] || controlData["Waterpump1"]) {
    updates["Control/Waterpump1"] = true;
    updates["Control/Waterpump2"] = true;

    return FirebaseDatabase.instance.ref().update(updates);
  } else if (!controlData["Waterpump1"] && !controlData["Waterpump2"]) {
    updates["Control/Waterpump1"] = true;
    updates["Control/Waterpump2"] = true;

    return FirebaseDatabase.instance.ref().update(updates);
  } else {
    updates["Control/Waterpump1"] = false;
    updates["Control/Waterpump2"] = false;

    return FirebaseDatabase.instance.ref().update(updates);
  }
}

Future<void> updateRoof1() async {
  Map<String, Object?> updates = {};
  updates["Control/Roof1"] = !controlData["Roof1"];
  return FirebaseDatabase.instance.ref().update(updates);
}

Future<void> updateRoof2() async {
  Map<String, Object?> updates = {};
  updates["Control/Roof2"] = !controlData["Roof2"];
  return FirebaseDatabase.instance.ref().update(updates);
}

Future<void> updateWaterpump1() async {
  Map<String, Object?> updates = {};
  updates["Control/Waterpump1"] = !controlData["Waterpump1"];
  return FirebaseDatabase.instance.ref().update(updates);
}

Future<void> updateWaterpump2() async {
  Map<String, Object?> updates = {};
  updates["Control/Waterpump2"] = !controlData["Waterpump2"];
  return FirebaseDatabase.instance.ref().update(updates);
}
