import 'package:chess/piece/abstract_piece.dart';
import 'package:chess/squares/square_color.dart';
import 'package:chess/commun/location.dart';
class Square{
  final SquareColor squareColor;
  final Location location; 
  bool isOccupied; 
  AbstractPiece? currentPiece;


  Square(this.squareColor, this.location, this.isOccupied){
    currentPiece = null;
  }

  set setOccupied(bool isOccupied){
    this.isOccupied = isOccupied;
  }

  bool get getIsOccupied => isOccupied;


  set setCurrentPiece(AbstractPiece currentPiece){
    this.currentPiece = currentPiece;
  }

  AbstractPiece? get getCurrentPiece => currentPiece;


  SquareColor get getSquareColor => squareColor;
  Location get getLocation => location;

  void reset(){
    isOccupied = false;
  }
  
  @override
  String toString() {
    return 'Square{squareColor: $squareColor, location: $location, isOccupied: $isOccupied}';
  }
}