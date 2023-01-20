import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../utils/xoxo_utils.dart';
part 'xoxo_event.dart';
part 'xoxo_state.dart';

class XoxoBloc extends Bloc<XoxoEvent, XoxoState> {
  XoxoBloc() : super(XoxpInitial()) {
    on<LoadedGme>((event, emit) {
      emit(XoxoPlayState(
          msg: state.msg, tiles: List.filled(9, 0), isme: state.isme));
    });
    on<PlayerClick>((event, emit) {
      List<int> tile = state.tiles;
      if (tile[event.index] == 0) {
        if (state.isme) {
          tile[event.index] = 1;
        } else {
          tile[event.index] = 2;
        }
      }

      emit(XoxoPlayState(
          msg: XoxoUtils().checkResult(state.isme, tile),
          tiles: state.tiles,
          isme: !state.isme));
    });

    // on<XoxoResult>((event, emit) {
    //   emit(XoxoPlayState(
    //       msg: XoxoUtils().checkResult(state.isme, state.tiles),
    //       tiles: state.tiles,
    //       isme: state.isme));
    // });

    on<ClearXoxo>(
      (event, emit) {
        emit(
            XoxoPlayState(msg: "", tiles: List.filled(9, 0), isme: state.isme));
      },
    );
  }
}
