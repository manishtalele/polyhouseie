import 'package:flutter/material.dart';
import 'package:polyhouseie/Theme/deftheme.dart';

class Dashboard extends StatefulWidget {
  final int soilmoisture;
  final bool roof1, roof2 , pump1 , pump2 ;
  const Dashboard(
      {super.key,
      required this.soilmoisture,
      required this.roof1,
      required this.roof2, required this.pump1, required this.pump2});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String waterlevel = "Low", soilmoisture = "Low";

  check() {
    if (widget.soilmoisture == 2) {
      setState(() {
        soilmoisture = "High";
      });
    } else if (widget.soilmoisture == 1) {
      setState(() {
        soilmoisture = "Medium";
      });
    } else {
      setState(() {
        soilmoisture = "Low";
      });
    }

  }

  @override
  void initState() {
    check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    check();
    double width = MediaQuery.of(context).size.width;
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dashboard",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: primary2Color),
          ),
          const SizedBox(
            height: 10,
          ),
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
                      text: 'Water Pump-1: ',
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
                      text: 'Water Pump-2: ',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text:  widget.pump2 ? "ON" : "OFF",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color:
                                    widget.pump2 ? primaryColor : Colors.red)),
                      ],
                    ),
                  ),
                   RichText(
                    text: TextSpan(
                      text: 'Soil moisture: ',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: soilmoisture,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: widget.soilmoisture == 1
                                  ? Colors.yellow
                                  : widget.soilmoisture == 2
                                      ? primaryColor
                                      : Colors.red),
                        ),
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
