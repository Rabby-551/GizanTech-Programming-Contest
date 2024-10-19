import 'dart:io';

void main() {
  print('Enter Input Number:');
  List<int> params = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int G = params[0], S = params[1], P = params[2];

  List<List<int>> sets = [];
  for (int i = 0; i < S; i++) {
    List<int> goods = stdin.readLineSync()!.split(' ').map(int.parse).toList();
    sets.add(goods.sublist(1));
  }

  List<int> shopAssignment = List.filled(S, -1);
  bool canAssign = assignShops(sets, P, shopAssignment);

  if (canAssign) {
    print("YES");
    print(shopAssignment.map((shop) => shop + 1).join(' '));
  } else {
    print("NO");
  }
}

bool areSimilar(List<int> a, List<int> b) {
  if ((a.length - b.length).abs() > 1) return false;

  Map<int, int> countA = countItems(a);
  Map<int, int> countB = countItems(b);

  int differences = 0;

  for (var key in countA.keys) {
    if (countB.containsKey(key)) {
      differences += (countA[key]! - countB[key]!).abs();
    } else {
      differences += countA[key]!;
    }
  }

  for (var key in countB.keys) {
    if (!countA.containsKey(key)) {
      differences += countB[key]!;
    }
  }

  return (differences == 1 || (a.length != b.length && differences == 0));
}

Map<int, int> countItems(List<int> goods) {
  Map<int, int> countMap = {};
  for (var item in goods) {
    countMap[item] = (countMap[item] ?? 0) + 1;
  }
  return countMap;
}

bool assignShops(List<List<int>> sets, int P, List<int> shopAssignment) {
  for (int node = 0; node < sets.length; node++) {
    if (shopAssignment[node] == -1) {
      if (!colorNode(sets, node, P, shopAssignment)) {
        return false;
      }
    }
  }
  return true;
}

bool colorNode(
    List<List<int>> sets, int node, int P, List<int> shopAssignment) {
  Set<int> usedShops = {};

  for (int neighbor = 0; neighbor < sets.length; neighbor++) {
    if (neighbor != node &&
        shopAssignment[neighbor] != -1 &&
        areSimilar(sets[node], sets[neighbor])) {
      usedShops.add(shopAssignment[neighbor]);
    }
  }

  for (int shop = 0; shop < P; shop++) {
    if (!usedShops.contains(shop)) {
      shopAssignment[node] = shop;
      return true;
    }
  }

  return false;
}
