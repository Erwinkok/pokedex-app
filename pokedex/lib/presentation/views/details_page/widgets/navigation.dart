import 'package:flutter/material.dart';
import 'package:pokedex/config/theme.dart';

class Navigation extends StatelessWidget {
  const Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.arrow_back),
              color: AppColors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.favorite_border),
              color: AppColors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
