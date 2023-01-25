import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_game/bloc/xoxo_bloc.dart';
import 'mobile_view/mobile.dart';
import 'web_view/web.dart';

class XoxoHome extends StatefulWidget {
  const XoxoHome({Key? key}) : super(key: key);

  @override
  State<XoxoHome> createState() => _XoxoHomeState();
}

class _XoxoHomeState extends State<XoxoHome> {
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
                  return MobileScreen(
                      tiles: state.tiles,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      msg: state.msg,
                      isMe: state.isme);
                }
                return WebScreen(
                    tiles: state.tiles,
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    msg: state.msg,
                    isMe: state.isme);
              });
            },
          );
        }
      }),
    );
  }
}
