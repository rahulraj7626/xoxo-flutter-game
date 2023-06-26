import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../riverpod/xoxo_notifier.dart';
import 'mobile_view/mobile.dart';
import 'web_view/web.dart';

class XoxoHome extends HookConsumerWidget {
  const XoxoHome({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final xoxoData = ref.watch(xoxoProvider);
    final state = xoxoData;
    return Scaffold(
      body: xoxoData == XoxpInitial
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(builder: (context, constraints) {
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
            }),
    );
  }
}

// class XoxoHome extends StatefulWidget {
//   const XoxoHome({Key? key}) : super(key: key);

//   @override
//   State<XoxoHome> createState() => _XoxoHomeState();
// }

// class _XoxoHomeState extends State<XoxoHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<XoxoBloc, XoxoState>(builder: (context, state) {
//         if (state is XoxpInitial) {
//           context.read<XoxoBloc>().add(LoadedGme());
//           return const Center(child: CircularProgressIndicator());
//         } else {
//           return BlocBuilder<XoxoBloc, XoxoState>(
//             builder: (context, state) {
//               return LayoutBuilder(builder: (context, constraints) {
//                 if (constraints.maxWidth < 600) {
//                   return MobileScreen(
//                       tiles: state.tiles,
//                       height: constraints.maxHeight,
//                       width: constraints.maxWidth,
//                       msg: state.msg,
//                       isMe: state.isme);
//                 }
//                 return WebScreen(
//                     tiles: state.tiles,
//                     height: constraints.maxHeight,
//                     width: constraints.maxWidth,
//                     msg: state.msg,
//                     isMe: state.isme);
//               });
//             },
//           );
//         }
//       }),
//     );
//   }
// }
