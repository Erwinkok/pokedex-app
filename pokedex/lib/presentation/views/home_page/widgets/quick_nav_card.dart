import 'package:flutter/material.dart';
import 'package:pokedex/config/theme.dart';

class QuickNavCard extends StatelessWidget {
  const QuickNavCard({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 3,
        ),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey,
                offset: Offset(0, 5),
                blurRadius: 10,
                spreadRadius: 3,
              ),
            ]),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -30,
              right: -50,
              width: 150,
              height: 150,
              child: Opacity(
                opacity: 0.2,
                child: Image(
                  image: AssetImage(
                    "assets/images/background-logo-light.png",
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(color: AppColors.black),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
