part of 'xoxo_bloc.dart';

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
  final List<int> tiles;
  final String msg;
  final bool isme;
  XoxoPlayState({
    required this.tiles,
    required this.msg,
    required this.isme,
  }) : super(tiles: tiles, msg: msg, isme: isme);
}
