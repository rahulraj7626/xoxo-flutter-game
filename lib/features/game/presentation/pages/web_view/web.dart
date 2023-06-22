import 'package:flutter/material.dart';
import 'package:simple_game/features/game/presentation/widgets/button_widget.dart';

import '../../../data/datasources/constants/asset_constatnts.dart';
import '../../widgets/gridview_widget.dart';
import '../../widgets/widget_helper.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({
    Key? key,
    required this.tiles,
    required this.height,
    required this.width,
    required this.msg,
    required this.isMe,
  }) : super(key: key);

  final List<int>? tiles;
  final double height;
  final double width;
  final String msg;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(backGround),
        fit: BoxFit.cover,
      )),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: GridViewWidget(tiles: tiles),
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const Spacer(),
                titleWidget(),
                const Spacer(),
                msgWidget(msg),
                const Spacer(),
                buttonWidget(context),
                const Spacer(),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Text msgWidget(msg) {
  return Text(
    msg,
    style: const TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
  );
}
