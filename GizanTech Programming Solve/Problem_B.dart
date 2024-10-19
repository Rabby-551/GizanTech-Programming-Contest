import 'dart:io';
import 'dart:math';

void main() {
  print('Enter The Number:');
  int T = int.parse(stdin.readLineSync()!);

  bool isValidK(List<int> heights, int k) {
    for (int i = 0; i < heights.length; i++) {
      int diff = (i == 0) ? heights[0] : heights[i] - heights[i - 1];
      if (diff > k) {
        return false;
      }
      if (diff == k) {
        k--;
      }
    }
    return true;
  }

  for (int t = 1; t <= T; t++) {
    int n = int.parse(stdin.readLineSync()!);

    List<int> heights =
        stdin.readLineSync()!.split(' ').map(int.parse).toList();

    int high = heights[0];
    for (int i = 1; i < n; i++) {
      high = max(high, heights[i] - heights[i - 1]);
    }

    int low = 1;
    int result = high;
    while (low <= high) {
      int mid = (low + high) ~/ 2;
      if (isValidK(heights, mid)) {
        result = mid;
        high = mid - 1;
      } else {
        low = mid + 1;
      }
    }

    print('Case $t: $result');
  }
}
