import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_game/bloc/xoxo_bloc.dart';
import 'package:simple_game/utils/xoxo_utils.dart';

class XoxoHome extends StatefulWidget {
  const XoxoHome({Key? key}) : super(key: key);

  @override
  State<XoxoHome> createState() => _XoxoHomeState();
}

class _XoxoHomeState extends State<XoxoHome> {
  // var tiles = List.filled(9, 0);
  // bool isMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<XoxoBloc, XoxoState>(builder: (context, state) {
        if (state is XoxpInitial) {
          context.read<XoxoBloc>().add(LoadedGme());
          return const Center(child: CircularProgressIndicator());
        } else {
          return BlocBuilder<XoxoBloc, XoxoState>(
            builder: (context, state) {
              return LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return mobile_screen(state.tiles, constraints.maxHeight,
                      constraints.maxWidth, state.msg, state.isme);
                }
                return web_screen(constraints.maxHeight, constraints.maxWidth);
              });
            },
          );
        }
      }),
    );
  }

  Container mobile_screen(
      List<int>? tiles, double height, double width, String msg, bool isMe) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: height,
      width: width,
      child: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                for (var i = 0; i < 9; i++)
                  Container(
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: InkWell(
                      onTap: () {
                        context.read<XoxoBloc>().add(PlayerClick(index: i));
                        // setState(() {
                        //   if (tiles![i] == 0) {
                        //     if (isMe) {
                        //       tiles[i] = 1;
                        //       isMe = !isMe;
                        //     } else {
                        //       tiles[i] = 2;
                        //       isMe = !isMe;
                        //     }
                        //   }
                        // });
                      },
                      child: Center(
                          child: Text(
                        tiles![i] == 0
                            ? ''
                            : tiles[i] == 1
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
              // setState(() {
              //   tiles = List.filled(9, 0);
              // });
            },
          ),
          SizedBox(
            height: height * 0.02,
          )
        ],
      ),
    );
  }

  Container web_screen(double height, double width) {
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
                          // setState(() {
                          //   if (tiles[i] == 0) {
                          //     if (isMe) {
                          //       tiles[i] = 1;
                          //       isMe = !isMe;
                          //     } else {
                          //       tiles[i] = 2;
                          //       isMe = !isMe;
                          //     }
                          //   }
                          // });
                        },
                        child: Center(
                            child: Text(
                          // tiles[i] == 0
                          //     ? ''
                          //     : tiles[i] == 1
                          //         ? 'X'
                          //         : 'O',

                          "",
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
              "",
              // XoxoUtils().checkResult(isMe, tiles),
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
              // setState(() {
              //   tiles = List.filled(9, 0);
              // });
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
