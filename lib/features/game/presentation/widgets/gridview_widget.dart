import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/constants/asset_constatnts.dart';
import '../bloc/xoxo_bloc.dart';
import 'widget_helper.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.tiles,
  });

  final List<int>? tiles;

  @override
  Widget build(BuildContext context) {
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
                  context.read<XoxoBloc>().add(PlayerClick(index: i));
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
