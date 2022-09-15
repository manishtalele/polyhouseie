import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:polyhouseie/Theme/deftheme.dart';
import 'package:polyhouseie/screens/controlscreen.dart';

class ControlCard extends StatefulWidget {
  const ControlCard({super.key});

  @override
  State<ControlCard> createState() => _ControlCardState();
}

class _ControlCardState extends State<ControlCard> {
  @override
  Widget build(BuildContext context) {
    Widget controlBtn({required String image, required String name}) => Card(
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
                  SvgPicture.asset(image),
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
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
            controlBtn(image: 'assets/icon/roofing.svg', name: "Open Roof"),
            const Spacer(),
            controlBtn(image: "assets/icon/water.svg", name: "Put Water"),
            const Spacer(),
          ],
        )
      ],
    );
  }
}
