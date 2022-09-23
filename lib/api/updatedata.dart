import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:polyhouseie/api/userid.dart';

CollectionReference users = FirebaseFirestore.instance.collection('polyhouse');

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
