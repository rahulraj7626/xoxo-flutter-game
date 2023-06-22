import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/constants/string_constants.dart';
import '../bloc/xoxo_bloc.dart';

OutlinedButton buttonWidget(BuildContext context) {
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
      context.read<XoxoBloc>().add(ClearXoxo());
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
