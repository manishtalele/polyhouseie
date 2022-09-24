import 'package:cloud_firestore/cloud_firestore.dart';

String uid = "user-1";
Stream userData =
    FirebaseFirestore.instance.collection('polyhouse').doc(uid).snapshots();
