import 'dart:io';
import 'dart:collection';

void main() {
  int i;
  print("Enter Input Number:");

  SplayTreeMap<String, int> dictionary = SplayTreeMap();

  int n = int.parse(stdin.readLineSync()!);

  for (i = 0; i < n; i++) {
    String operation = stdin.readLineSync()!;

    String opType = operation[0];

    if (opType == '0') {
      int spaceIndex = operation.lastIndexOf(' ');
      String key = operation.substring(1, spaceIndex);
      int value = int.parse(operation.substring(spaceIndex + 1));

      dictionary[key] = value;
    } else if (opType == '1') {
      String key = operation.substring(1);

      print(dictionary[key] ?? 0);
    } else if (opType == '2') {
      String key = operation.substring(1);

      dictionary.remove(key);
    } else if (opType == '3') {
      int spaceIndex = operation.indexOf(' ');
      String l = operation.substring(1, spaceIndex);
      String r = operation.substring(spaceIndex + 1);

      for (var entry in dictionary.entries) {
        if (entry.key.compareTo(l) >= 0 && entry.key.compareTo(r) <= 0) {
          print('${entry.key} ${entry.value}');
        }
      }
    }
  }
}
