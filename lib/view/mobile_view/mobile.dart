import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_game/bloc/xoxo_bloc.dart';
import 'package:simple_game/utils/xoxo_utils.dart';

class MobileScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(backGround),
        fit: BoxFit.cover,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(2),
            height: width,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: GridView.count(
              padding: EdgeInsets.all(0),
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
                              : Image.asset(tiles![i] == 1
                                  ? playerImage1
                                  : playerImage2)),
                    ),
                  )
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     msg,
          //     style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          //   ),
          // ),
          // IconButton(
          //   icon: Icon(
          //     Icons.refresh,
          //     size: 50,
          //     color: Colors.red[500],
          //   ),
          //   onPressed: () {
          //     context.read<XoxoBloc>().add(ClearXoxo());
          //   },
          // ),
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
