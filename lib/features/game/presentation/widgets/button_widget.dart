import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/datasources/constants/string_constants.dart';
import '../riverpod/xoxo_notifier.dart';

OutlinedButton buttonWidget(BuildContext context, WidgetRef ref) {
  return OutlinedButton.icon(
    icon: const Icon(
      Icons.replay,
      color: Colors.white,
    ),
    label: const Padding(
      padding: EdgeInsets.all(4.0),
      child: Text(
        reset,
        style: TextStyle(color: Colors.white),
      ),
    ),
    onPressed: () {
      ref.read(xoxoProvider.notifier).clearXoxo();
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      side: const BorderSide(width: 2.0, color: Colors.red),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );
}
