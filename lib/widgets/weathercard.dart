import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:polyhouseie/Theme/deftheme.dart';
import 'package:polyhouseie/screens/weatherscreen.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            "Weather forecast",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: primary2Color),
          ),
          const Spacer(),
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WeatherScreen())),
            child: SvgPicture.asset("assets/icon/Back.svg"),
          )
        ]),
        const SizedBox(
          height : 20 
        ),
        Card(
          child:  Padding(padding: const EdgeInsets.symmetric(),
          child: Row(),),
        )
      ],
    );
  }
}
