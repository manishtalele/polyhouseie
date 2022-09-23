import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:polyhouseie/Theme/deftheme.dart';
import 'package:polyhouseie/api/updatedata.dart';
import 'package:polyhouseie/api/userid.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({
    super.key,
  });

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  Stream userData =
      FirebaseFirestore.instance.collection('polyhouse').doc(uid).snapshots();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text("Controls",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              )),
        ),
        backgroundColor: const Color(0xFFF4F4F4),
        body: StreamBuilder(
            stream: userData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }
              if (snapshot.hasData) {
                // print(snapshot.data["roof-1"]);
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: Text(
                          "Roof",
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w500,
                              color: primary2Color),
                        ),
                      ),
                      Center(
                          child: Image.asset(
                        "assets/image/roof.png",
                        height: width / 2,
                        width: width - 20,
                      )),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: snapshot.data["roof-1"]
                                      ? primaryColor
                                      : Colors.white,
                                  foregroundColor: snapshot.data["roof-1"]
                                      ? Colors.white
                                      : primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () => updateRoof1(),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 8),
                                child: Text(
                                  "Roof-1",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400),
                                ),
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: snapshot.data["roof-2"]
                                      ? primaryColor
                                      : Colors.white,
                                  foregroundColor: snapshot.data["roof-2"]
                                      ? Colors.white
                                      : primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () => updateRoof2(),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 8),
                                child: Text(
                                  "Roof-2",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400),
                                ),
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: Text(
                          "Water Pump",
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w500,
                              color: primary2Color),
                        ),
                      ),
                      Center(
                          child: Image.asset("assets/image/waterpump.png",
                              height: width / 2, width: width)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Spacer(),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: snapshot.data["waterpump-1"]
                                      ? primaryColor
                                      : Colors.white,
                                  foregroundColor: snapshot.data["waterpump-1"]
                                      ? Colors.white
                                      : primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () => updateWaterpump1(),
                              child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "Water Pump -1",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              )),
                          const Spacer(),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: snapshot.data["waterpump-2"]
                                      ? primaryColor
                                      : Colors.white,
                                  foregroundColor: snapshot.data["waterpump-2"]
                                      ? Colors.white
                                      : primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () => updateWaterpump2(),
                              child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "Water Pump -2",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              )),
                          const Spacer()
                        ],
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
