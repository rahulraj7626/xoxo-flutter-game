import 'package:flutter/material.dart';

borderFun(int i) {
  switch (i) {
    case 0:
      return const Border(
        right: BorderSide(),
        bottom: BorderSide(),
      );

    case 1:
      return const Border(
        right: BorderSide(),
        bottom: BorderSide(),
      );
    case 2:
      return const Border(
        bottom: BorderSide(),
      );
    case 3:
      return const Border(
        right: BorderSide(),
        bottom: BorderSide(),
      );

    case 4:
      return const Border(
        right: BorderSide(),
        bottom: BorderSide(),
      );
    case 5:
      return const Border(
        bottom: BorderSide(),
      );

    case 6:
      return const Border(
        right: BorderSide(),
      );
    case 7:
      return const Border(
        right: BorderSide(),
      );
    default:
      return const Border(
        right: BorderSide(color: Colors.transparent),
      );
  }
}

Text titleWidget() {
  return const Text(
    "XOXO Game",
    style: TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
  );
}
