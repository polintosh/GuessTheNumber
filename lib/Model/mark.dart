// Classe que representa una marca de puntuació al joc.
class Mark {
  // La puntuació obtinguda.
  final int score;
  // La data i hora en què es va aconseguir la puntuació.
  final DateTime dateTime;

  // Constructor de la classe Mark.
  // Requereix la puntuació i la data/hora.
  Mark({required this.score, required this.dateTime});
}
