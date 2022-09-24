import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:polyhouseie/Theme/deftheme.dart';
import 'package:polyhouseie/api/updatedata.dart';
import 'package:polyhouseie/api/userid.dart';
import 'package:polyhouseie/screens/controlscreen.dart';

class ControlCard extends StatefulWidget {
  const ControlCard({super.key});

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
    return StreamBuilder(
        stream: userData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (snapshot.hasData) {
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
                        onTap: () => updateRoofs(),
                        child: controlBtn(
                            image: 'assets/icon/roofing.svg',
                            name: "Open Roof",
                            check1: snapshot.data["roof-1"],
                            check2: snapshot.data["roof-2"])),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          updateWaterpump1();
                          updateWaterpump2();
                        },
                        child: controlBtn(
                            image: "assets/icon/water.svg",
                            name: "Put Water",
                            check2: snapshot.data["waterpump-1"],
                            check1: snapshot.data["waterpump-2"])),
                    const Spacer(),
                  ],
                )
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
