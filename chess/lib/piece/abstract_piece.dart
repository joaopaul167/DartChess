import 'package:chess/piece/piece_color.dart';
import 'package:chess/piece/movable.dart';
import 'package:chess/squares/square.dart';

abstract class AbstractPiece implements Movable {
    late String name;
    PieceColor pieceColor;
    late Square currentSquare;

    AbstractPiece(this.pieceColor, this.currentSquare);
  
    PieceColor get getPieceColor => pieceColor;

    Square get getCurrentSquare => currentSquare;

    String get getName => name;
    
    set setCurrentSquare(Square currentSquare) {
      this.currentSquare = currentSquare;
    }

    @override
    String toString() {
      return 'AbstractPiece{name: $name, pieceColor: $pieceColor, currentSquare: $currentSquare}';
    }
}