import 'dart:collection';

import 'package:chess/piece/abstract_piece.dart';
import 'package:chess/piece/piece_color.dart';
import 'package:chess/piece/piece_factory.dart';
import 'package:chess/squares/square.dart';
import 'package:chess/squares/square_color.dart';
import 'package:chess/commun/file.dart';
import 'package:chess/commun/location.dart';
import "dart:io";
class Board {
  static const int boardSize = 8;
  final Map<Location, Square> locationSquareMap = HashMap();

  List<List<Square>> boardSquares = List.generate(boardSize, 
  (i) => List.generate(boardSize, 
  (i) => Square(SquareColor.light, Location(File.A,0) , false)));
  
  final List<AbstractPiece> lightPieces = List.empty(growable: true);
  final List<AbstractPiece> darkPieces = List.empty(growable: true);

  Board(){
    Map<Location, AbstractPiece> pieces = PieceFactory.getPieces();
    for(int i = 0; i < boardSquares.length; i++){
      int column = 0;
      SquareColor currentColor = ( i % 2 == 0) ? SquareColor.light : SquareColor.dark;
      for (File file in File.values){
        Square newSquare = Square(currentColor, Location(file, boardSize - i), false);
        locationSquareMap.putIfAbsent(newSquare.location, () => newSquare);
        if(pieces.containsKey(newSquare.location)){
          print(pieces.values.where((element) => element.currentSquare.location == newSquare.location));
          AbstractPiece piece = pieces.values.where((element) => element.currentSquare.location == newSquare.location).first;
          newSquare.currentPiece = piece;
          newSquare.isOccupied = true;
          piece.currentSquare = newSquare;
          if(piece.pieceColor == PieceColor.dark){
            darkPieces.add(piece);
          }else{
            lightPieces.add(piece);
          }
        }
        boardSquares[i][column] = newSquare;
        currentColor = (currentColor == SquareColor.light) ? SquareColor.dark : SquareColor.light;
        column++;
      }
    }
  }
  
  Map<Location, Square> getLocationSquareMap(){
    return locationSquareMap;
  }

  List<AbstractPiece> getLightPieces(){
    return lightPieces;
  }

  List<AbstractPiece> getDarkPieces(){
    return darkPieces;
  }

  void printBoard(){
    for(int i = 0; i < boardSquares.length; i++){
      stdout.write('${boardSize - i} ');
      for(int j = 0; j < boardSquares[i].length; j++){
        if (boardSquares[i][j].isOccupied){
          AbstractPiece? piece = boardSquares.elementAt(i).elementAt(0).currentPiece;
          stdout.write('${piece!.name[0]} ');
        } else {
          //empty square
          stdout.write("- ");
        }
      }
      print('');
    }
    stdout.write('  ');
    for( File file in File.values){
      stdout.write('${file.name} ');
    }
    print('');
  }
}