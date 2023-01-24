import 'dart:io';

import 'package:chess/board/board.dart';
import 'package:chess/commun/file.dart';
import 'package:chess/commun/location.dart';
import 'package:chess/piece/movable.dart';
import 'package:chess/squares/square.dart';
void main(List<String> arguments) {
  // PieceColor color = PieceColor.dark;
  // Movable pawn = Pawn(color);
  // Movable bishop = Bishop(color);
  // Queen queen = Queen.bishopRook(color, bishop, pawn);
  // printPiece(queen);
  // print(bishop);
  // printPiece(pawn);
  Board board = Board();
  board.printBoard();
  // board.getLightPieces().forEach((piece) => print(piece));
  String? line = stdin.readLineSync();
  while(true){
    if(line == null){
      break;
    }
    List<String> fromTo = line.split("->");
    File fromFile = File.values.where((file) => file.name == fromTo[0].toUpperCase().substring(0,1)).toList().first;
    int fromRank = int.parse(fromTo[0].substring(1));
    File toFile = File.values.where((file) => file.name == fromTo[1].toUpperCase().substring(0,1)).toList().first;
    int toRank = int.parse(fromTo[1].substring(1));
    Square? fromSq = board.getLocationSquareMap()[Location(fromFile, fromRank)];
    Square? toSq = board.getLocationSquareMap()[Location(toFile, toRank)];
    if(fromSq!.currentPiece != null && toSq!.currentPiece != null){
      // print(fromSq.currentPiece);
      // print(toSq);
      fromSq.currentPiece!.makeMove(toSq);
      fromSq.reset();
      board.printBoard();
    }
  }
}

void printPiece(Movable piece) {
  // print(piece.toString());
  piece.getValidMoves(Board());
}