import 'package:flutter/material.dart';

import '../constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required this.onChanged,
  }) : super(key: key);
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 40,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: Icon(Icons.search),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: kTextLightColor,
          ),
        ),
      ),
    );
  }
}
