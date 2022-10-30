import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:polyhouseie/Theme/deftheme.dart';
import 'package:polyhouseie/api/updatedata.dart';
import 'package:polyhouseie/screens/controlscreen.dart';

class ControlCard extends StatefulWidget {
  final bool roof1, roof2, waterpump1, waterpump2;
  const ControlCard(
      {super.key,
      required this.roof1,
      required this.roof2,
      required this.waterpump1,
      required this.waterpump2});

  @override
  State<ControlCard> createState() => _ControlCardState();
}

class _ControlCardState extends State<ControlCard> {
  @override
  Widget build(BuildContext context) {
    Widget controlBtn(
            {required String image,
            required String name,
            required bool check1,
            required bool check2}) =>
        Card(
          color: check1 && check2 ? primaryColor : Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: SizedBox(
            height: 140,
            width: 140,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    image,
                    width: 60,
                    height: 60,
                    color: check1 && check2 ? Colors.white : Colors.black,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: check1 && check2 ? Colors.white : Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        );

    return Column(
      children: [
        Row(
          children: [
            Text(
              "Controls",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: primary2Color),
            ),
            const Spacer(),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ControlScreen())),
              child: SvgPicture.asset("assets/icon/Back.svg"),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Spacer(),
            InkWell(
                onTap: () {
                  updateRoofs();
                  setState(() {});
                },
                child: controlBtn(
                    image: 'assets/icon/roofing.svg',
                    name: "Open Roof",
                    check1: widget.roof1,
                    check2: widget.roof2)),
            const Spacer(),
            InkWell(
                onTap: () {
                  updatePumps();
                  setState(() {});
                },
                child: controlBtn(
                    image: "assets/icon/water.svg",
                    name: "Put Water",
                    check2: widget.waterpump1,
                    check1: widget.waterpump2)),
            const Spacer(),
          ],
        )
      ],
    );
  }
}
