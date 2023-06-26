import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/xoxo_utils.dart';

part 'xoxo_state.dart';

class XoxoNotifier extends StateNotifier<XoxoState> {
  XoxoNotifier() : super(XoxpInitial()) {
    state = XoxoPlayState(
        msgValue: XoxoUtils.initialMsg(),
        tilesValue: List.filled(9, 0),
        ismeStatus: state.isme);
  }
  void playerClick(int index) {
    List<int> tile = state.tiles;
    if (tile[index] == 0) {
      if (state.isme) {
        tile[index] = 1;
      } else {
        tile[index] = 2;
      }
      state = XoxoPlayState(
          msgValue: XoxoUtils().checkResult(!state.isme, tile),
          tilesValue: state.tiles,
          ismeStatus: !state.isme);
    }
  }

  void clearXoxo() {
    state = XoxoPlayState(
        msgValue: XoxoUtils.initialMsg(),
        tilesValue: List.filled(9, 0),
        ismeStatus: true);
  }
}

final xoxoProvider = StateNotifierProvider<XoxoNotifier, XoxoState>((ref) {
  return XoxoNotifier();
});
