import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:polyhouseie/api/userid.dart';

CollectionReference users = FirebaseFirestore.instance.collection('polyhouse');

updateRoofs() async {
  bool roof1Ref = false, roof2Ref = false;
  await users.doc(uid).get().then((value) {
    roof1Ref = value["roof-1"];
    roof2Ref = value["roof-2"];
  });
  if (roof1Ref && roof2Ref) {
    users
        .doc(uid)
        .update({'roof-2': !roof2Ref, "roof-1": !roof1Ref})
        .then((value) => print("Data Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  } else if (roof1Ref || roof2Ref) {
    users
        .doc(uid)
        .update({'roof-2': true, "roof-1": true})
        .then((value) => print("Data Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  } else if (!roof1Ref && !roof2Ref) {
    users
        .doc(uid)
        .update({'roof-2': true, "roof-1": true})
        .then((value) => print("Data Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  } else {
    users
        .doc(uid)
        .update({'roof-2': false, "roof-1": false})
        .then((value) => print("Data Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}

Future<void> updateRoof1() async {
  bool ref = false;
  await users.doc(uid).get().then((value) => ref = value["roof-1"]);

  return users
      .doc(uid)
      .update({'roof-1': !ref})
      .then((value) => print("Data Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}

Future<void> updateRoof2() async {
  bool ref = false;
  await users.doc(uid).get().then((value) => ref = value["roof-2"]);

  return users
      .doc(uid)
      .update({'roof-2': !ref})
      .then((value) => print("Data Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}

Future<void> updateWaterpump1() async {
  bool ref = false;
  await users.doc(uid).get().then((value) => ref = value["waterpump-1"]);
  return users
      .doc(uid)
      .update({'waterpump-1': !ref})
      .then((value) => print("Data Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}

Future<void> updateWaterpump2() async {
  bool ref = false;
  await users.doc(uid).get().then((value) => ref = value["waterpump-2"]);
  return users
      .doc(uid)
      .update({'waterpump-2': !ref})
      .then((value) => print("Data Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}
