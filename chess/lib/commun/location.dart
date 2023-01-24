import 'package:chess/commun/file.dart';
import 'package:quiver/core.dart';
class Location {
  // file is A,B,C,D,E,F,G,H
  // rank is 1,2,3,4,5,6,7,8
  final File file ;
  final int rank;
  Location(this.file, this.rank);
  
  File get getFile => file; 
  int get getRank => rank;

  bool equals (Object o) {
    if (this == o) return true;
    if (o is! Location) return false;
    Location location = o;
    return file == location.file &&
           rank == location.rank;
  }
  // override hashCode to make Location hashable
  // override operator because its linked to hashCode keyword
  @override
  bool operator ==(other) => other is Location && file == other.file && rank == other.rank;
  @override
  int get hashCode => hash2(file.hashCode,rank.hashCode);
  @override
  String toString() => 'Location{file: $file, rank: $rank}';
}