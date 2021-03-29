import 'package:flutter/material.dart';
import 'package:pokedex/components/navigation_bar.dart';
import 'package:pokedex/config/theme.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          overflow: Overflow.visible,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavigationBar(),
                  Title("Pokédex"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String title;

  Title(this.title);

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
