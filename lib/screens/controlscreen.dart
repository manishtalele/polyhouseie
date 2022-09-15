import 'package:flutter/material.dart';
import 'package:polyhouseie/Theme/deftheme.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  bool btn1 = true, btn2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Controls"),
      ),
      backgroundColor: const Color(0xFFF4F4F4),
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Roof",
              style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w600,
                  color: primary2Color),
            ),
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: btn1 ? primaryColor : Colors.white,
                      foregroundColor: btn1 ? Colors.white : primaryColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Roof-1",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    )),
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: btn2 ? primaryColor : Colors.white,
                      foregroundColor: btn2 ? Colors.white : primaryColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Roof-2",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    )),
                const Spacer()
              ],
            ),
            Text(
              "Water Pump",
              style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w600,
                  color: primary2Color),
            ),
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: btn1 ? primaryColor : Colors.white,
                      foregroundColor: btn1 ? Colors.white : primaryColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Water Pump -1",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    )),
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: btn2 ? primaryColor : Colors.white,
                      foregroundColor: btn2 ? Colors.white : primaryColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Water Pump -2",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
