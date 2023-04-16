import 'dart:math';
import 'package:flutter/material.dart';

class RandomWordProvider with ChangeNotifier {
  int _number = 1;
  int get number => _number;

  final List<dynamic> _promptList = [
    ["My friends (watch, watches) a lot of television.", "watches", "watch"],
    ["My cousin (live, lives) in Pampanga.", "lives", "live"],
    ["Michael (want, wants) to be a pilot.", "wants", "want"],
    ["My hamster (is, are) very hungry.", "is", "are"],
    ["We (need, needs) to buy a new car.", "need", "needs"],
  ];

  String _currentWord = "";
  String _currentFirst = "";
  String _currentSecond = "";

  RandomWordProvider() {
    generateRandomWord();
  }

  String get currentWord => _currentWord;
  String get currentFirst => _currentFirst;
  String get currentSecond => _currentSecond;

  void generateRandomWord() {
    int randomNum = Random().nextInt(_promptList.length);
    String randomWord = _promptList[randomNum][0];
    String randomFirst = _promptList[randomNum][1];
    String randomSecond = _promptList[randomNum][2];
    _currentWord = randomWord;
    _currentFirst = randomFirst;
    _currentSecond = randomSecond;

    _promptList.removeAt(randomNum);
    print(_promptList);
    notifyListeners();
  }

  bool _isCorrect = false;

  bool get isCorrect => _isCorrect;

  int _level = 0;
  int get level => _level;

  void addLevel() {
    _level++;
    notifyListeners();
  }

  void resetLevel() {
    _level = 0;
    notifyListeners();
  }

  void addNumber() {
    _number++;
    notifyListeners();
  }
}
