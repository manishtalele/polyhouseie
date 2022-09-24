import 'package:flutter/material.dart';
import 'package:polyhouseie/Theme/deftheme.dart';

class ControlDashBoard extends StatefulWidget {
  final bool roof1, roof2, pump1, pump2;
  const ControlDashBoard(
      {super.key,
      required this.pump1,
      required this.pump2,
      required this.roof1,
      required this.roof2});

  @override
  State<ControlDashBoard> createState() => _ControlDashBoardState();
}

class _ControlDashBoardState extends State<ControlDashBoard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: width - 40,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Roof-1: ',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: widget.roof1 ? "Open" : "Close",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color:
                                    widget.roof1 ? primaryColor : Colors.red)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Roof-2: ',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: widget.roof2 ? "Open" : "Close",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color:
                                    widget.roof2 ? primaryColor : Colors.red)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'WaterPump-1: ',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: widget.pump1 ? "ON" : "OFF",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color:
                                    widget.pump1 ? primaryColor : Colors.red)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'WaterPump-2: ',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: widget.pump2 ? "ON" : "OFF",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color:
                                    widget.pump2 ? primaryColor : Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
