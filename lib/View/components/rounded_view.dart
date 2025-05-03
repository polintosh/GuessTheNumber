import 'package:flutter/material.dart';

// Widget reutilitzable per mostrar una icona dins d'un cercle
// amb una vora.
class RoundedView extends StatelessWidget {
  // La icona que es mostrarà dins del cercle.
  final IconData icon;
  // Constructor del RoundedView.
  const RoundedView({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    // Contenidor que defineix la forma i l'estil del cercle.
    return Container(
      width: 56, // Amplada fixa.
      height: 56, // Alçada fixa.
      // Decoració del contenidor.
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Fa que el contenidor sigui un cercle.
        // Defineix la vora del cercle.
        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
      ),
      // La icona que es mostra dins del contenidor circular.
      child: Icon(
        icon, // La icona a mostrar (passada com a paràmetre).
        size: 48, // Mida de la icona.
        // Color de la icona, basat en el tema actual.
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
