import 'dart:io';
import 'Dice.dart';

void main() {
  print('Enter the number of dice throws:');
  int? number = int.parse(stdin.readLineSync()!);

  Dice dice = Dice(false, number);
  dice.numberOfThrows = number;
  throwDiceAndPrintStatistics(dice);
  dice.resetStatistics();
  dice.equalDistr = true;
  throwDiceAndPrintStatistics(dice);
}

void throwDiceAndPrintStatistics(Dice dice) {
  int i = 0;
  while (i < dice.numberOfThrows) {
    dice.throwDice();
    i++;
  }
  print(
      "Sum statistics when the equalDistr is ${dice.equalDistr} = ${dice.sumStatistics}");
}
