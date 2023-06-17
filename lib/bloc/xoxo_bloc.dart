import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/xoxo_utils.dart';
part 'xoxo_event.dart';
part 'xoxo_state.dart';

class XoxoBloc extends Bloc<XoxoEvent, XoxoState> {
  XoxoBloc() : super(XoxpInitial()) {
    on<LoadedGme>((event, emit) {
      emit(XoxoPlayState(
          msgValue: XoxoUtils.initialMsg(),
          tilesValue: List.filled(9, 0),
          ismeStatus: state.isme));
    });
    on<PlayerClick>((event, emit) {
      List<int> tile = state.tiles;
      if (tile[event.index] == 0) {
        if (state.isme) {
          tile[event.index] = 1;
        } else {
          tile[event.index] = 2;
        }
        emit(XoxoPlayState(
            msgValue: XoxoUtils().checkResult(!state.isme, tile),
            tilesValue: state.tiles,
            ismeStatus: !state.isme));
      }
    });
    on<ClearXoxo>(
      (event, emit) {
        emit(XoxoPlayState(
            msgValue: XoxoUtils.initialMsg(),
            tilesValue: List.filled(9, 0),
            ismeStatus: true));
      },
    );
  }
}
