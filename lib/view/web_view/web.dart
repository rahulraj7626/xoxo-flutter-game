import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_game/bloc/xoxo_bloc.dart';

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
      margin: const EdgeInsets.all(20),
      height: height,
      width: width,
      child: Column(
        children: [
          SizedBox(
            height: height * 0.12,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  for (var i = 0; i < 9; i++)
                    Container(
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: InkWell(
                        onTap: () {
                          context.read<XoxoBloc>().add(PlayerClick(index: i));
                        },
                        child: Center(
                            child: Text(
                          tiles![i] == 0
                              ? ''
                              : tiles![i] == 1
                                  ? 'X'
                                  : 'O',
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600),
                        )),
                      ),
                    )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              msg,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.refresh,
              size: 50,
              color: Colors.red[500],
            ),
            onPressed: () {
              context.read<XoxoBloc>().add(ClearXoxo());
            },
          ),
          SizedBox(
            height: height * 0.02,
          )
        ],
      ),
    );
  }
}
