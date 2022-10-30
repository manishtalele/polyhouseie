import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:polyhouseie/Theme/deftheme.dart';
import 'package:polyhouseie/api/getdata.dart';
import 'package:polyhouseie/api/updatedata.dart';
import 'package:polyhouseie/api/userid.dart';
import 'package:polyhouseie/widgets/conroldashboard.dart';

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
        body: loader
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 20),
                      child: Text(
                        "DashBoard",
                        style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w500,
                            color: primary2Color),
                      ),
                    ),
                     ControlDashBoard(
                      pump1: controlData["Waterpump1"],
                      roof1: controlData["Roof1"],
                      roof2: controlData["Roof2"],
                      pump2: controlData["Waterpump2"],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 20),
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
                                backgroundColor: controlData["Roof1"]
                                    ? primaryColor
                                    : Colors.white,
                                foregroundColor: controlData["Roof1"]
                                    ? Colors.white
                                    : primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () async {
                              await updateRoof1();
                              setState(() {});
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 8),
                              child: Text(
                                "Roof1",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w500),
                              ),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: controlData["Roof2"]
                                    ? primaryColor
                                    : Colors.white,
                                foregroundColor: controlData["Roof2"]
                                    ? Colors.white
                                    : primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () async {
                              await updateRoof2();
                              setState(() {});
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 8),
                              child: Text(
                                "Roof2",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w500),
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 20),
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
                                backgroundColor: controlData["Waterpump1"]
                                    ? primaryColor
                                    : Colors.white,
                                foregroundColor: controlData["Waterpump1"]
                                    ? Colors.white
                                    : primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () async {
                              await updateWaterpump1();
                              setState(() {});
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Water Pump -1",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            )),
                        const Spacer(),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: controlData["Waterpump2"]
                                    ? primaryColor
                                    : Colors.white,
                                foregroundColor: controlData["Waterpump2"]
                                    ? Colors.white
                                    : primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () async {
                              await updateWaterpump2();
                              setState(() {});
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Water Pump -2",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            )),
                        const Spacer()
                      ],
                    ),
                  ],
                ),
              ));
  }
}
