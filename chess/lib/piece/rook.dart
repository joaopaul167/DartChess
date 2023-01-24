import 'package:chess/board/board.dart';
import 'package:chess/commun/file.dart';
import 'package:chess/commun/location.dart';
import 'package:chess/commun/location_factory.dart';
import 'package:chess/piece/abstract_piece.dart';
import 'package:chess/piece/movable.dart';
import 'package:chess/piece/piece_color.dart';
import 'package:chess/squares/square.dart';
class Rook extends AbstractPiece implements Movable {
  bool isFirstMove = true;
  Rook(PieceColor pieceColor, Square square) : super(pieceColor, square){
    name = "Rook";
  }

  @override
  List<Location> getValidMoves(Board board){
    List<Location> moveCandidates = List.empty(growable: true);
    Map<Location, Square> squareMap = board.getLocationSquareMap();
    Location current = super.currentSquare.location;
    getFileCandidates(moveCandidates, squareMap, current, -1);
    getFileCandidates(moveCandidates, squareMap, current,  1);
    getRankCandidates(moveCandidates, squareMap, current, -1);
    getRankCandidates(moveCandidates, squareMap, current,  1);
    return moveCandidates;
  }

  void getRankCandidates(
    List<Location> moveCandidates,
    Map<Location, Square> squareMap,
    Location current,
    int offset,
  ){
    Location next = LocationFactory.build(current, current.file.index, offset);
    while(squareMap.containsKey(next)){
      if(squareMap[next]!.isOccupied){
        if(squareMap[next]!.currentPiece!.pieceColor == pieceColor){
          break;
        }
        moveCandidates.add(next);
        break;
      }
      moveCandidates.add(next);
      next = LocationFactory.build(next, current.file.index, offset);
    }
  }

  void getFileCandidates(
    List<Location> moveCandidates,
    Map<Location, Square> squareMap,
    Location current,
    int offset,
  ){
    Location next = LocationFactory.build(current, offset, 0);
    while(squareMap.containsKey(next)){
      if(squareMap[next]!.isOccupied){
        if(squareMap[next]!.currentPiece!.pieceColor == pieceColor){
          break;
        }
        moveCandidates.add(next);
        break;
      }
      moveCandidates.add(next);
      next = LocationFactory.build(next, offset, 0);
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