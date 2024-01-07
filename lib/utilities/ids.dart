import 'package:uuid/uuid.dart';

class IDsGenerator {
  var id = const Uuid().v4();

  String getID() {
    return id;
  }
}
