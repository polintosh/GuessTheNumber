import 'dart:math';

class Game {
  static final int minValue = 0;
  static final int maxValue = 100;

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
}
