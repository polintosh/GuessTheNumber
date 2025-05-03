import 'dart:math';

import 'package:flutter_guess_the_number/model/mark.dart';

class Game {
  static final int minValue = 0;
  static final int maxValue = 100;
  List<Mark> marks = [];

  int _targetValue = 0;
  int _points = 0;
  int _score = 0;
  int _rounds = 0;

  int get score => _score;
  int get rounds => _rounds;
  int get targetValue => _targetValue;
  int get points => _points;

  Game() {
    _targetValue = Random().nextInt(maxValue + 1 - minValue) + minValue;
  }

  void calculatePoints(double sliderValue) {
    int sliderValueInt = sliderValue.round().toInt();
    int difference = (_targetValue - sliderValueInt).abs();
    _points = (maxValue - difference);
    _score += _points;
    _rounds++;
  }

  void reset() {
    _targetValue = Random().nextInt(maxValue + 1 - minValue) + minValue;
    _points = 0;
  }

  void restartGame() {
    _targetValue = Random().nextInt(maxValue + 1 - minValue) + minValue;
    _points = 0;
    _score = 0;
    _rounds = 0;
  }

  void addMark(int points) {
    marks.add(Mark(score: points, dateTime: DateTime.now()));
    marks.sort((a, b) => b.score.compareTo(a.score));
    if (marks.length > 5) {
      marks = marks.sublist(0, 5);
    }
  }

  void saveCurrentScore() {
    if (_points > 0) {
      addMark(_points);
    }
  }

  // Not void - Because returns object
  List<Mark> getTopMarks() {
    return marks;
  }
}
