import 'package:flutter/material.dart';
import 'package:pokedex/config/theme.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    this.icon = const Icon(Icons.search),
    this.hintText = "Search pokemon, moves, abilities...",
    this.backgroundColor = AppColors.lightGrey,
  }) : super(key: key);

  final Icon icon;
  final String hintText;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        color: backgroundColor,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.grey,
          ),
          border: InputBorder.none,
          icon: icon,
        ),
      ),
    );
  }
}
