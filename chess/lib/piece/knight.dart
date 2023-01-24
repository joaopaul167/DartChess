import 'package:chess/board/board.dart';
import 'package:chess/commun/file.dart';
import 'package:chess/commun/location.dart';
import 'package:chess/commun/location_factory.dart';
import 'package:chess/piece/abstract_piece.dart';
import 'package:chess/piece/movable.dart';
import 'package:chess/piece/piece_color.dart';
import 'package:chess/squares/square.dart';
class Knight extends AbstractPiece implements Movable {
  Knight(PieceColor pieceColor, Square square) :  super(pieceColor, square){
    name = "Knight";
  }

  @override
  List<Location> getValidMoves(Board board){
    List<Location> moveCandidates = List.empty(growable: true);
    Map<Location, Square> squareMap = board.getLocationSquareMap();
    Location current = super.currentSquare.location;
    getMoves(moveCandidates, squareMap, current, 2, 1);
    getMoves(moveCandidates, squareMap, current, 2, -1);
    getMoves(moveCandidates, squareMap, current, -2, -1);
    getMoves(moveCandidates, squareMap, current,  -2, 1);
    return moveCandidates;
  }

  void getMoves(
    List<Location> moveCandidates,
    Map<Location, Square> squareMap,
    Location current,
    int rankOffset,
    int fileOffset
  ){
    Location next = LocationFactory.build(current, fileOffset, rankOffset);
    if(squareMap.containsKey(next)){
      if(squareMap[next]!.isOccupied){
        if(squareMap[next]!.currentPiece!.pieceColor == pieceColor) return;
        moveCandidates.add(next);
        return;
      }
      moveCandidates.add(next);
    }
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