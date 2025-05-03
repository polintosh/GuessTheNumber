import 'dart:math';

import 'package:flutter_guess_the_number/model/mark.dart';

// Classe que representa la lògica i l'estat del joc "Guess the Number".
class Game {
  // Valor mínim possible per al número objectiu i el slider.
  static const int minValue = 0;
  // Valor màxim possible per al número objectiu i el slider.
  static const int maxValue = 100;
  // Llista per emmagatzemar les millors puntuacions (marques).
  List<Mark> marks = [];

  // Variables privades per emmagatzemar l'estat intern del joc.
  int _targetValue = 0; // El número aleatori que l'usuari ha d'endevinar.
  int _points = 0; // Punts obtinguts en la ronda actual.
  int _score = 0; // Puntuació total acumulada durant la partida.
  int _rounds = 0; // Nombre de rondes jugades en la partida actual.

  // Getters públics per accedir a l'estat del joc des de fora de la classe (ViewModel).
  int get score => _score;
  int get rounds => _rounds;
  int get targetValue => _targetValue;
  int get points => _points;

  // Constructor de la classe Game.
  // Inicialitza el joc generant el primer valor objectiu aleatori.
  Game() {
    // Genera un número aleatori entre minValue i maxValue (inclosos).
    _targetValue = Random().nextInt(maxValue + 1 - minValue) + minValue;
  }

  // Calcula els punts obtinguts en funció del valor seleccionat al slider.
  void calculatePoints(double sliderValue) {
    // Arrodoneix el valor del slider a l'enter més proper.
    int sliderValueInt = sliderValue.round().toInt();
    // Calcula la diferència absoluta entre el valor objectiu i el valor del slider.
    int difference = (_targetValue - sliderValueInt).abs();
    // Calcula els punts: 100 menys la diferència. Com més a prop, més punts.
    _points = (maxValue - difference);
    // Afegeix els punts a la puntuació total.
    _score += _points;
    // Incrementa el comptador de rondes.
    _rounds++;
  }

  // Reinicia l'estat per a una nova ronda (però manté la puntuació i rondes totals).
  void reset() {
    // Genera un nou valor objectiu aleatori.
    _targetValue = Random().nextInt(maxValue + 1 - minValue) + minValue;
    // Reinicia els punts de la ronda actual.
    _points = 0;
  }

  // Reinicia completament el joc a l'estat inicial.
  void restartGame() {
    // Genera un nou valor objectiu aleatori.
    _targetValue = Random().nextInt(maxValue + 1 - minValue) + minValue;
    // Reinicia els punts de la ronda.
    _points = 0;
    // Reinicia la puntuació total.
    _score = 0;
    // Reinicia el comptador de rondes.
    _rounds = 0;
    // NOTA: No esborra les marques guardades, només l'estat de la partida actual.
  }

  // Afegeix una nova marca (puntuació) a la llista de millors puntuacions.
  void addMark(int points) {
    // Crea un objecte Mark amb la puntuació i la data/hora actual.
    marks.add(Mark(score: points, dateTime: DateTime.now()));
    // Ordena la llista de marques de major a menor puntuació.
    marks.sort((a, b) => b.score.compareTo(a.score));
    // Manté només les 5 millors puntuacions.
    if (marks.length > 5) {
      marks = marks.sublist(0, 5);
    }
  }

  // Guarda la puntuació de la ronda actual (_points) com una marca.
  // Es crida normalment al final d'una ronda amb èxit.
  void saveCurrentScore() {
    // Només afegeix la marca si s'han obtingut punts en aquesta ronda.
    if (_points > 0) {
      addMark(_points);
    }
  }

  // Retorna la llista actual de les millors marques (top 5).
  List<Mark> getTopMarks() {
    return marks;
  }
}
