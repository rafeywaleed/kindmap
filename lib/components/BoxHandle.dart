import 'package:flutter/material.dart';
import 'package:kindmap/themes/KMTheme.dart';

Widget BoxHandle(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 7,
      width: size.width * 0.2,
      decoration: BoxDecoration(
        color: KMTheme.of(context).secondaryText,
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}
