import 'package:flutter/material.dart';
import 'package:flutter_guess_the_number/view/components/marks_view.dart';
import 'package:flutter_guess_the_number/view/components/number_view.dart';
import 'package:flutter_guess_the_number/view/components/rounded_view.dart';
import 'package:flutter_guess_the_number/viewmodel/view_model.dart';
import 'package:provider/provider.dart';

// Widget que representa la capa de fons de la UI.
// Mostra elements com els botons de reinici/marques i la puntuació/ronda.
class BackgroundView extends StatelessWidget {
  // Constructor del widget BackgroundView.
  const BackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    // Obté l'estat de l'aplicació (ViewModel) utilitzant Provider.
    // `context.watch` fa que el widget es reconstrueixi quan l'estat canvia.
    var appState = context.watch<ViewModel>();

    // Padding general per als elements del fons.
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 40),
      // Columna per organitzar els elements verticalment.
      child: Column(
        children: [
          // Fila superior amb botons.
          Row(
            children: [
              // Botó per reiniciar el joc.
              TextButton(
                onPressed: () {
                  // Crida al mètode restartGame del ViewModel.
                  appState.restartGame();
                },
                // Utilitza un widget personalitzat RoundedView per l'aparença del botó.
                child: RoundedView(icon: Icons.refresh),
              ),
              const Spacer(), // Espai flexible per empènyer els botons als extrems.
              // Botó per mostrar la pantalla de marques.
              TextButton(
                onPressed: () {
                  // Navega a la pantalla MarksView.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MarksView()),
                  );
                },
                // Utilitza un widget personalitzat RoundedView.
                child: RoundedView(icon: Icons.list),
              ),
            ],
          ),
          const Spacer(), // Espai flexible per empènyer la fila inferior cap avall.
          // Fila inferior amb la puntuació i la ronda.
          Row(
            children: [
              // Mostra la puntuació actual.
              NumberView(text: "SCORE", value: appState.score),
              const Spacer(), // Espai flexible.
              // Mostra la ronda actual.
              NumberView(text: "ROUND", value: appState.rounds),
            ],
          ),
        ],
      ),
    );
  }
}
