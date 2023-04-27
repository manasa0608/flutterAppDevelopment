import 'dart:math';

class Dice {
  static const minDie = 1;
  static const maxDie = 6;
  bool equalDistr = false;
  var die = List.filled(2, 0);
  int numberOfThrows = 0;
  var sumStatistics = List.filled(maxDie * 2 + 1, 0);
  var dieStatistics = List.generate(maxDie, (_) => List.filled(maxDie, 0));

  Dice(this.equalDistr, this.numberOfThrows);

  void throwDice() {
    Random random = Random();
    if (equalDistr) {
      int sum = random.nextInt(maxDie * 2 - 1) + 2;
      if (sum > maxDie) {
        var temp1 = List.empty(growable: true);
        for (int i = minDie; i <= maxDie; i++) {
          for (int j = minDie; j <= maxDie; j++) {
            if (i + j == sum) {
              temp1.add(i);
            }
          }
        }
        die[0] = temp1[random.nextInt(temp1.length)];
        die[1] = sum - die[0];
      } else {
        die[0] = random.nextInt(sum - minDie) + 1;
        die[1] = sum - die[0];
      }
    } else {
      die[0] = random.nextInt(maxDie - minDie + 1) + minDie;
      die[1] = random.nextInt(maxDie - minDie + 1) + minDie;
    }

    numberOfThrows += 1;
    sumStatistics[die[0] + die[1]] += 1;
    dieStatistics[die[0] - 1][die[1] - 1] += 1;
  }

  void resetStatistics() {
    sumStatistics = List.filled(maxDie * 2 + 1, 0);
    dieStatistics = List.generate(maxDie, (_) => List.filled(maxDie, 0));
    numberOfThrows = 0;
  }
}
