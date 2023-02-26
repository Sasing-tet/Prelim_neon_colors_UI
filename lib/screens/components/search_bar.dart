// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:sasing_prelims/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: Color.fromARGB(118, 68, 68, 68),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.search,
              color: iconColor.withOpacity(0.5),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                ),
                child: TextField(
                  style: TextStyle(
                    color: textColor.withOpacity(0.5),
                    fontSize: homeSubtitleText,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: textColor.withOpacity(0.5),
                      fontSize: homeSubtitleText,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.mic,
              color: iconColor.withOpacity(0.5),
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
