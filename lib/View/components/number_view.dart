import 'package:flutter/material.dart';

// Widget reutilitzable per mostrar un text (etiqueta) i un valor numèric
// dins d'un contenidor amb vores arrodonides.
class NumberView extends StatelessWidget {
  // El text de l'etiqueta (p. ex., "SCORE", "ROUND").
  final String text;
  // El valor numèric a mostrar.
  final int value;

  // Constructor del NumberView.
  const NumberView({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    // Columna per apilar l'etiqueta a sobre del valor.
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center, // Centra els elements verticalment.
      children: [
        // Text de l'etiqueta.
        Text(text),
        // Contenidor per donar forma i estil al valor numèric.
        Container(
          width: 68, // Amplada fixa.
          height: 56, // Alçada fixa.
          alignment: Alignment.center, // Centra el text dins del contenidor.
          // Decoració del contenidor (vores i cantonades arrodonides).
          decoration: BoxDecoration(
            // Defineix la vora.
            border: Border.all(
              // Color de la vora basat en el tema actual.
              color: Theme.of(context).colorScheme.onSurface,
            ),
            // Defineix el radi de les cantonades arrodonides.
            borderRadius: BorderRadius.circular(10),
          ),
          // Text que mostra el valor numèric.
          child: Text("$value"),
        ),
      ],
    );
  }
}
