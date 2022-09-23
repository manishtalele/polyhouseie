import 'package:flutter/material.dart';
import 'package:polyhouseie/Theme/deftheme.dart';

class Dashboard extends StatefulWidget {
  final int waterlevel, soilmoisture;
  final bool roof1, roof2;
  const Dashboard(
      {super.key,
      required this.waterlevel,
      required this.soilmoisture,
      required this.roof1,
      required this.roof2});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String waterlevel = "Low", soilmoisture = "Low";

  @override
  void initState() {
    if (widget.waterlevel == 2) {
      setState(() {
        waterlevel = "High";
      });
    } else if (widget.waterlevel == 1) {
      setState(() {
        waterlevel = "Medium";
      });
    } else {
      setState(() {
        waterlevel = "Low";
      });
    }
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dashboard",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, color: primary2Color),
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
                                color: widget.roof1 ? Colors.green : Colors.red)),
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
                                color: widget.roof2 ? Colors.green : Colors.red)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Water Level: ',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: waterlevel,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: widget.waterlevel == 1
                                  ? Colors.yellow
                                  : widget.waterlevel == 2
                                      ? Colors.green
                                      : Colors.red),
                        ),
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
                                      ? Colors.green
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
