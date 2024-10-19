import 'dart:io';

void main() {
  int i;
  print('Enter Inpur Number:');
  String magical = stdin.readLineSync()!;

  List<int> prefixFunction(String s) {
    int n = s.length;
    List<int> pai = List.filled(n, 0);

    for (i = 1; i < n; i++) {
      int j = pai[i - 1];

      while (j > 0 && s[i] != s[j]) {
        j = pai[j - 1];
      }

      if (s[i] == s[j]) {
        j++;
      }

      pai[i] = j;
    }

    return pai;
  }

  List<int> pai = prefixFunction(magical);
  List<int> borders = [];

  for (int k = pai[magical.length - 1]; k > 0; k = pai[k - 1]) {
    borders.add(k);
  }

  if (borders.isNotEmpty) {
    borders = borders.reversed.toList();
    print(borders.join(" "));
  } else {
    print("");
  }
}
