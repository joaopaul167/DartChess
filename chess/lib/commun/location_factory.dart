import 'package:chess/commun/location.dart';

import 'file.dart';

class LocationFactory {
  static final List<File> files = File.values;
  static Location build(Location current, int fileOffset, int rankOffset) {
    int currentFile = current.getFile.index;
    return Location(files[currentFile + fileOffset], current.getRank + rankOffset);
  }
}