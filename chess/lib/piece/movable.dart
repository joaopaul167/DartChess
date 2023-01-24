import 'package:chess/board/board.dart';
import 'package:chess/commun/location.dart';
import 'package:chess/squares/square.dart';

abstract class Movable {
  List<Location> getValidMoves(Board board);
  List<Location> getValidMovesFromSquare(Board board, Square square);
  void makeMove(Square square);
}