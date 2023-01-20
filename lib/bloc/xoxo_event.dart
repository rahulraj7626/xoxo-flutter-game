part of 'xoxo_bloc.dart';

@immutable
abstract class XoxoEvent {}

class SearchData extends XoxoEvent {
  final String? msg;
  final List<int> tiles;

  SearchData(
    this.tiles, {
    this.msg,
  });
}

class LoadedGme extends XoxoEvent {}

class PlayerClick extends XoxoEvent {
  final int index;

  PlayerClick({required this.index});
}

class Player2Click extends XoxoEvent {}

class ClearXoxo extends XoxoEvent {}

class XoxoResult extends XoxoEvent {}
