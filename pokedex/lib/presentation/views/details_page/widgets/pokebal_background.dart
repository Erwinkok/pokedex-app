import 'package:flutter/material.dart';

class PokebalBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.width / 4,
      right: -100,
      child: Opacity(
        opacity: 0.1,
        child: Image.asset(
          "assets/images/background-logo-light.png",
          width: 400,
          height: 400,
        ),
      ),
    );
  }
}
