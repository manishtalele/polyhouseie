import 'package:flutter/material.dart';
import 'package:polyhouseie/Theme/deftheme.dart';

// ignore: must_be_immutable
class ControlScreen extends StatefulWidget {
  bool roofbtn1, roofbtn2, pumpbtn1, pumpbtn2;
  ControlScreen(
      {super.key,
      required this.roofbtn1,
      required this.roofbtn2,
      required this.pumpbtn1,
      required this.pumpbtn2});

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                        backgroundColor:
                            widget.roofbtn1 ? primaryColor : Colors.white,
                        foregroundColor:
                            widget.roofbtn1 ? Colors.white : primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      setState(() {
                        widget.roofbtn1 = !widget.roofbtn1;
                      });
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                      child: Text(
                        "Roof-1",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor:
                            widget.roofbtn2 ? primaryColor : Colors.white,
                        foregroundColor:
                            widget.roofbtn2 ? Colors.white : primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      setState(() {
                        widget.roofbtn2 = !widget.roofbtn2;
                      });
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                      child: Text(
                        "Roof-2",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                        backgroundColor:
                            widget.pumpbtn1 ? primaryColor : Colors.white,
                        foregroundColor:
                            widget.pumpbtn1 ? Colors.white : primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      setState(() {
                        widget.pumpbtn1 = !widget.pumpbtn1;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Water Pump -1",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    )),
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor:
                            widget.pumpbtn2 ? primaryColor : Colors.white,
                        foregroundColor:
                            widget.pumpbtn2 ? Colors.white : primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      setState(() {
                        widget.pumpbtn2 = !widget.pumpbtn2;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Water Pump -2",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    )),
                const Spacer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
