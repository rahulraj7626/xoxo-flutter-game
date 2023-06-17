import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_game/bloc/xoxo_bloc.dart';
import 'package:simple_game/utils/xoxo_utils.dart';

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
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(0),
                childAspectRatio: 1.1,
                shrinkWrap: true,
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
                                    tiles![i] == 1
                                        ? playerImage1
                                        : playerImage2,
                                    scale: 1.5,
                                  )),
                      ),
                    )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "XOXO Game",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  msg,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                OutlinedButton.icon(
                  icon: const Icon(
                    Icons.replay,
                    color: Colors.white,
                  ),
                  label: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      reset,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    context.read<XoxoBloc>().add(ClearXoxo());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.red,
                    side: const BorderSide(width: 2.0, color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

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
