import 'package:flutter/material.dart';
import 'package:flutter_guess_the_number/model/app_colors.dart';
import 'package:flutter_guess_the_number/viewmodel/view_model.dart';
import 'package:provider/provider.dart';

// Widget que mostra la pantalla amb les 5 millors puntuacions (marques).
class MarksView extends StatelessWidget {
  // Constructor del MarksView.
  const MarksView({super.key});

  @override
  Widget build(BuildContext context) {
    // Obté l'instància del ViewModel utilitzant context.watch.
    // Això assegura que el widget es reconstrueixi si les dades del ViewModel canvien.
    final viewModel = context.watch<ViewModel>();
    // Obté la llista de les millors marques des del ViewModel.
    final topMarks = viewModel.getTopMarks();

    // Scaffold proporciona l'estructura bàsica de la pantalla (AppBar, Body).
    return Scaffold(
      // Barra superior de l'aplicació per a aquesta pantalla.
      appBar: AppBar(
        title: const Text('Top 5 Puntuacions'), // Títol de la barra.
        backgroundColor: AppColors.primaryColor, // Color de fons.
        foregroundColor: Colors.white, // Color del text/icones.
      ),
      // Cos de la pantalla: una llista desplaçable de les marques.
      body: ListView.builder(
        // Nombre d'elements a la llista (nombre de marques).
        itemCount: topMarks.length,
        // Funció que construeix cada element de la llista.
        itemBuilder: (context, index) {
          // Obté la marca per a la posició actual (index).
          final mark = topMarks[index];
          // Card per donar un aspecte de targeta a cada element.
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            // ListTile per estructurar fàcilment el contingut de la targeta.
            child: ListTile(
              // Element a l'esquerra: un cercle amb el número de posició.
              leading: CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Text(
                  '#${index + 1}', // Mostra el número de rànquing (1-based).
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Títol principal: la puntuació.
              title: Text(
                'Puntuació: ${mark.score}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              // Subtítol: la data i hora de la marca.
              subtitle: Text(
                // Formata la data per mostrar-la sense milisegons.
                'Data: ${mark.dateTime.toString().split('.')[0]}',
                style: TextStyle(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
