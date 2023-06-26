import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/datasources/constants/asset_constatnts.dart';
import '../riverpod/xoxo_notifier.dart';
import 'widget_helper.dart';

class GridViewWidget extends HookConsumerWidget {
  const GridViewWidget({
    super.key,
    required this.tiles,
  });

  final List<int>? tiles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        childAspectRatio: 1.1,
        crossAxisCount: 3,
        children: [
          for (var i = 0; i < 9; i++)
            Container(
              decoration: BoxDecoration(border: borderFun(i)),
              child: InkWell(
                onTap: () {
                  ref.read(xoxoProvider.notifier).playerClick(i);
                },
                child: Center(
                    child: tiles![i] == 0
                        ? const SizedBox()
                        : Image.asset(
                            tiles![i] == 1 ? playerImage1 : playerImage2,
                            scale: 1.5,
                          )),
              ),
            )
        ],
      ),
    );
  }
}
