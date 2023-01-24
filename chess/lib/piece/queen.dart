import 'package:chess/board/board.dart';
import 'package:chess/commun/file.dart';
import 'package:chess/commun/location.dart';
import 'package:chess/piece/abstract_piece.dart';
import 'package:chess/piece/movable.dart';
import 'package:chess/piece/piece_color.dart';
import 'package:chess/squares/square.dart';
class Queen extends AbstractPiece implements Movable {
  late Movable bishop;
  late Movable rook;
  Queen(PieceColor pieceColor, Square square) : super(pieceColor, square){
    name = "Queen";
  }

  Queen.bishopRook(PieceColor pieceColor, Square square,this.bishop, this.rook) : super(pieceColor, square);

  @override
  List<Location> getValidMoves(Board board){
    List<Location> moveCandidates = List.empty(growable: true);
    moveCandidates.addAll(bishop.getValidMovesFromSquare(board, super.currentSquare));
    moveCandidates.addAll(rook.getValidMovesFromSquare(board, super.currentSquare));
    return moveCandidates;
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