import 'dart:collection';
import 'dart:io';

import 'package:chess/commun/file.dart';
import 'package:chess/commun/location.dart';
import 'package:chess/piece/abstract_piece.dart';
import 'package:chess/piece/bishop.dart';
import 'package:chess/piece/dummy.dart';
import 'package:chess/piece/king.dart';
import 'package:chess/piece/knight.dart';
import 'package:chess/piece/pawn.dart';
import 'package:chess/piece/piece_color.dart';
import 'package:chess/piece/queen.dart';
import 'package:chess/piece/rook.dart';
import 'package:chess/squares/square.dart';
import 'package:chess/squares/square_color.dart';

class PieceFactory{
  PieceFactory();
  static Map<Location, AbstractPiece> getPieces() {
    Map<Location, AbstractPiece> pieces = HashMap();

    //rooks
    pieces.addAll({Location(File.A, 1): Rook(PieceColor.light, Square(SquareColor.dark,Location(File.A, 1), true))});
    pieces.addAll({Location(File.H, 1): Rook(PieceColor.light, Square(SquareColor.light,Location(File.H, 1), true))});
    pieces.addAll({Location(File.A, 8): Rook(PieceColor.dark, Square(SquareColor.light,Location(File.A, 8), true))});
    pieces.addAll({Location(File.H, 8): Rook(PieceColor.dark, Square(SquareColor.dark,Location(File.H, 8), true))});

    // knights
    pieces.addAll({Location(File.B, 1): Knight(PieceColor.light, Square(SquareColor.dark,Location(File.B, 1), true))});
    pieces.addAll({Location(File.G, 1): Knight(PieceColor.light, Square(SquareColor.light,Location(File.G, 1), true))});
    pieces.addAll({Location(File.B, 8): Knight(PieceColor.dark, Square(SquareColor.light,Location(File.B, 8), true))});
    pieces.addAll({Location(File.G, 8): Knight(PieceColor.dark, Square(SquareColor.dark,Location(File.G, 8), true))});

    // bishops
    pieces.addAll({Location(File.C, 1): Bishop(PieceColor.light, Square(SquareColor.dark,Location(File.C, 1), true))});
    pieces.addAll({Location(File.F, 1): Bishop(PieceColor.light, Square(SquareColor.light,Location(File.F, 1), true))});
    pieces.addAll({Location(File.C, 8): Bishop(PieceColor.dark, Square(SquareColor.light,Location(File.C, 8), true))});
    pieces.addAll({Location(File.F, 8): Bishop(PieceColor.dark, Square(SquareColor.dark,Location(File.F, 8), true))});

    // queens
    pieces.addAll({Location(File.D, 1): Queen(PieceColor.light, Square(SquareColor.light,Location(File.D, 1), true))});
    pieces.addAll({Location(File.D, 8): Queen(PieceColor.dark, Square(SquareColor.dark,Location(File.D, 8), true))});

    // kings
    pieces.addAll({Location(File.E, 1): King(PieceColor.light, Square(SquareColor.dark,Location(File.E, 1), true))});
    pieces.addAll({Location(File.E, 8): King(PieceColor.dark, Square(SquareColor.light,Location(File.E, 8), true))});


      pieces.addAll({Location(File.A, 2): Pawn(PieceColor.light, Square(SquareColor.dark,Location(File.A, 2), true))});
      pieces.addAll({Location(File.A, 7): Pawn(PieceColor.dark, Square(SquareColor.dark,Location(File.A, 7), true))});

      pieces.addAll({Location(File.B, 2): Pawn(PieceColor.light, Square(SquareColor.dark,Location(File.B, 2), true))});
      pieces.addAll({Location(File.B, 7): Pawn(PieceColor.dark, Square(SquareColor.dark,Location(File.B, 7), true))});

      pieces.addAll({Location(File.C, 2): Pawn(PieceColor.light, Square(SquareColor.dark,Location(File.C, 2), true))});
      pieces.addAll({Location(File.C, 7): Pawn(PieceColor.dark, Square(SquareColor.dark,Location(File.C, 7), true))});

      pieces.addAll({Location(File.D, 2): Pawn(PieceColor.light, Square(SquareColor.dark,Location(File.D, 2), true))});
      pieces.addAll({Location(File.D, 7): Pawn(PieceColor.dark, Square(SquareColor.dark,Location(File.D, 7), true))});

      pieces.addAll({Location(File.E, 2): Pawn(PieceColor.light, Square(SquareColor.dark,Location(File.E, 2), true))});
      pieces.addAll({Location(File.E, 7): Pawn(PieceColor.dark, Square(SquareColor.dark,Location(File.E, 7), true))});

      pieces.addAll({Location(File.F, 2): Pawn(PieceColor.light, Square(SquareColor.dark,Location(File.F, 2), true))});
      pieces.addAll({Location(File.F, 7): Pawn(PieceColor.dark, Square(SquareColor.dark,Location(File.F, 7), true))});

      pieces.addAll({Location(File.G, 2): Pawn(PieceColor.light, Square(SquareColor.dark,Location(File.G, 2), true))});
      pieces.addAll({Location(File.G, 7): Pawn(PieceColor.dark, Square(SquareColor.dark,Location(File.G, 7), true))});

      pieces.addAll({Location(File.H, 2): Pawn(PieceColor.light, Square(SquareColor.dark,Location(File.H, 2), true))});
      pieces.addAll({Location(File.H, 7): Pawn(PieceColor.dark, Square(SquareColor.dark,Location(File.H, 7), true))});
    

    return pieces;
  }
}