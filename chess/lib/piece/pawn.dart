import 'package:chess/board/board.dart';
import 'package:chess/commun/file.dart';
import 'package:chess/commun/location.dart';
import 'package:chess/commun/location_factory.dart';
import 'package:chess/piece/abstract_piece.dart';
import 'package:chess/piece/movable.dart';
import 'package:chess/piece/piece_color.dart';
import 'package:chess/squares/square.dart';
class Pawn extends AbstractPiece implements Movable {

  bool isFirstMove = true;
  Pawn(PieceColor pieceColor, Square square) : super(pieceColor, square){
    name = "Pawn";
  }

  @override
  List<Location> getValidMoves(Board board){
    List<Location> moveCandidates = List.empty(growable: true);
    Location current = getCurrentSquare.getLocation;
    //add forward move
    moveCandidates.add(LocationFactory.build(current, 0, 1));
    //add forward move if first move
    if (isFirstMove){
      moveCandidates.add(LocationFactory.build(current, 0, 2));
      return moveCandidates;
    }
    //add attack move
    moveCandidates.add(LocationFactory.build(current, 1, 1));
    moveCandidates.add(LocationFactory.build(current, -1, 1));

    //check if the square is out of the board
    Map<Location, Square> squareMap = board.getLocationSquareMap();
    List<Location> validMoves = moveCandidates
      .where((candidate)=>squareMap.containsKey(candidate))
      .toList();

    //check if the square is occupied by an enemy piece
    return validMoves
      .where((candidate)=> candidate.equals(getCurrentSquare.getLocation.file) 
      && squareMap.values.singleWhere((element) => element.location == candidate).isOccupied 
      ? false 
      : squareMap.values.singleWhere((element) => element.location == candidate).currentPiece!.pieceColor != pieceColor)
      .toList();
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