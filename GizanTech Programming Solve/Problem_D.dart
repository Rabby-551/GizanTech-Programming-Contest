import 'dart:io';

void main() {
  int t;

  print('Enter Number');

  int T = int.parse(stdin.readLineSync()!);

  for (t = 1; t <= T; t++) {
    int N = int.parse(stdin.readLineSync()!);

    int totalInvitations = N - 1;

    int totalPairs = (N * (N - 1)) ~/ 2;

    int friends = N - 1;

    int notFriends = totalPairs - friends;

    print('Case $t: $totalInvitations $notFriends');
  }
}
