import 'package:chess/board/board.dart';
import 'package:chess/commun/file.dart';
import 'package:chess/commun/location.dart';
import 'package:chess/piece/abstract_piece.dart';
import 'package:chess/piece/piece_color.dart';
import 'package:chess/squares/square.dart';
class Dummy extends AbstractPiece {
  bool isFirstMove = true;
  Dummy(PieceColor pieceColor, Square square) : super(pieceColor, square){
    name = "Dummy";
  }

  @override
  List<Location> getValidMoves(Board board){
    print("$name -> getValidMovesFromSquare");
    return [Location(File.A, 0)];
  }

  @override
  List<Location> getValidMovesFromSquare(Board board, Square? square){
    print("$name -> getValidMovesFromSquare");
    return [Location(File.A, 0)];
  }

  @override
  void makeMove(Square square){
    Square? current = super.currentSquare;
    currentSquare = square;
    current.reset();
  }
}