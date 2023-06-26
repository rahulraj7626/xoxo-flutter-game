part of 'xoxo_notifier.dart';

abstract class XoxoState {
  final List<int> tiles;
  final String msg;
  final bool isme;
  const XoxoState({
    this.tiles = const <int>[],
    this.msg = "",
    this.isme = true,
  });
}

class XoxpInitial extends XoxoState {}

class XoxoPlayState extends XoxoState {
  final List<int> tilesValue;
  final String msgValue;
  final bool ismeStatus;
  XoxoPlayState({
    required this.tilesValue,
    required this.msgValue,
    required this.ismeStatus,
  }) : super(tiles: tilesValue, msg: msgValue, isme: ismeStatus);
}
