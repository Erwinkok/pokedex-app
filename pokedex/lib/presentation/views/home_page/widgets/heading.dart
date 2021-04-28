import 'package:flutter/material.dart';

import 'custom_title.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -(screenSize.width / 2.25),
          right: -(screenSize.width / 2.5),
          width: screenSize.width,
          height: screenSize.width,
          child: Opacity(
            opacity: 0.1,
            child: Image(
              image: AssetImage("assets/images/background-logo.png"),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: CustomTitle(text),
        )
      ],
    );
  }
}
