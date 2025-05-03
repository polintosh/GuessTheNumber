import 'package:flutter/material.dart';
import 'package:flutter_guess_the_number/model/game.dart';
import 'package:flutter_guess_the_number/model/mark.dart';

// ViewModel: Intermediari entre la Vista (UI) i el Model (lògica del joc).
// Utilitza ChangeNotifier per notificar als widgets quan l'estat canvia.
class ViewModel extends ChangeNotifier {
  // Instància privada del Model (Game) que conté la lògica i l'estat del joc.
  final Game _game = Game();

  // Getters per exposar les propietats del joc a la Vista de manera segura.
  int get score => _game.score; // Puntuació actual.
  int get rounds => _game.rounds; // Ronda actual.
  int get targetValue => _game.targetValue; // Valor objectiu a endevinar.
  int get points => _game.points; // Punts obtinguts en la ronda actual.

  // Mètode per calcular els punts basats en el valor del slider seleccionat per l'usuari.
  void calculatePoints(double sliderValue) {
    _game.calculatePoints(sliderValue); // Delega el càlcul al Model.
    notifyListeners(); // Notifica als widgets que l'estat ha canviat (actualitzar UI).
  }

  // Mètode per reiniciar la ronda actual.
  void reset() {
    _game.reset(); // Delega el reinici al Model.
    notifyListeners(); // Notifica als widgets.
  }

  // Mètode per reiniciar completament el joc (començar una nova partida).
  void restartGame() {
    // Si hi ha una puntuació acumulada, la guarda com a marca abans de reiniciar.
    if (_game.score > 0) {
      _game.addMark(_game.score);
    }
    _game.restartGame(); // Delega el reinici del joc al Model.
    notifyListeners(); // Notifica als widgets.
  }

  // Mètode per guardar la puntuació actual com una marca.
  void saveScore() {
    _game.saveCurrentScore(); // Delega l'acció al Model.
    // Opcionalment, es podria notificar si altres parts de la UI necessiten reaccionar
    // instantàniament als canvis en les marques.
    // notifyListeners();
  }

  // Mètode per obtenir la llista de les millors puntuacions (marques).
  List<Mark> getTopMarks() {
    return _game.getTopMarks(); // Obté les marques des del Model.
  }
}
