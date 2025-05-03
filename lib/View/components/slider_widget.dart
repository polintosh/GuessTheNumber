import 'package:flutter/material.dart';
import 'package:flutter_guess_the_number/model/app_colors.dart';

// Widget personalitzat que encapsula un Slider de Flutter
// juntament amb les etiquetes de valor mínim i màxim.
class SliderWidget extends StatelessWidget {
  // El valor actual del slider.
  final double value;
  // Callback que s'executa quan el valor del slider canvia.
  final ValueChanged<double> onChanged;
  // El valor mínim que pot tenir el slider.
  final double min;
  // El valor màxim que pot tenir el slider.
  final double max;

  // Constructor del SliderWidget.
  const SliderWidget({
    super.key,
    required this.value, // Paràmetre obligatori: valor actual.
    required this.onChanged, // Paràmetre obligatori: callback de canvi.
    required this.min, // Paràmetre obligatori: valor mínim.
    required this.max, // Paràmetre obligatori: valor màxim.
  });

  @override
  Widget build(BuildContext context) {
    // Fila per alinear horitzontalment l'etiqueta min, el slider i l'etiqueta max.
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center, // Centra els elements a la fila.
      children: [
        // Text que mostra el valor mínim del slider.
        Text(
          "${min.toInt()}", // Mostra la part entera del valor mínim.
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        // Expanded permet que el Slider ocupi tot l'espai disponible entre les etiquetes.
        Expanded(
          // El widget Slider estàndard de Flutter.
          child: Slider(
            value: value, // Valor actual.
            onChanged: onChanged, // Funció a cridar quan canvia el valor.
            min: min, // Valor mínim.
            max: max, // Valor màxim.
            activeColor:
                AppColors.primaryColor, // Color de la part activa del slider.
          ),
        ),
        // Text que mostra el valor màxim del slider.
        Text(
          "${max.toInt()}", // Mostra la part entera del valor màxim.
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
