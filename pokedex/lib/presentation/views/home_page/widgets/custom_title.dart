import 'package:flutter/material.dart';
import 'package:pokedex/config/theme.dart';

class CustomTitle extends StatelessWidget {
  final String title;

  CustomTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.black,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
