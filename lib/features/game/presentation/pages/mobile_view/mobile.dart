import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_game/features/game/presentation/widgets/widget_helper.dart';
import '../../../data/datasources/constants/asset_constatnts.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/gridview_widget.dart';
import '../web_view/web.dart';

class MobileScreen extends HookConsumerWidget {
  const MobileScreen({
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
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(backGround),
        fit: BoxFit.cover,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(),
          titleWidget(),
          const Spacer(),
          msgWidget(msg),
          const Spacer(),
          GridViewWidget(tiles: tiles),
          const Spacer(),
          buttonWidget(context, ref),
          const Spacer(),
        ],
      ),
    );
  }
}
