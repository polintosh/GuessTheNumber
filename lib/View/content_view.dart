import 'package:flutter/material.dart';
import 'package:flutter_guess_the_number/view/Components/slider_widget.dart';
import 'package:flutter_guess_the_number/viewmodel/view_model.dart';
import 'package:flutter_guess_the_number/model/app_colors.dart';
import 'package:provider/provider.dart';

// Widget principal que mostra el contingut interactiu del joc.
// Inclou el valor objectiu, el slider per endevinar i el botó "TRY".
class ContentView extends StatefulWidget {
  // Constructor del ContentView.
  const ContentView({super.key});

  @override
  State<ContentView> createState() => _ContentViewState();
}

// Estat associat al widget ContentView.
class _ContentViewState extends State<ContentView> {
  // Valor actual del slider, inicialitzat a 50.
  double _value = 50;
  // Valor mínim permès pel slider.
  // ignore: non_constant_identifier_names
  final double _MIN_VALUE = 1.0;
  // Valor màxim permès pel slider.
  // ignore: non_constant_identifier_names
  final double _MAX_VALUE = 100.0;

  @override
  Widget build(BuildContext context) {
    // Obté l'estat de l'aplicació (ViewModel) per accedir a les dades del joc.
    var appState = context.watch<ViewModel>();

    // Centre el contingut vertical i horitzontalment.
    return Center(
      // Columna per organitzar els elements verticalment.
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Centra els elements verticalment.
        children: [
          // Mostra una icona o text decoratiu.
          Text("🎯🎯🎯🎯", style: Theme.of(context).textTheme.headlineMedium),
          // Mostra el valor objectiu a endevinar.
          Text(
            "${appState.targetValue}", // Obté el valor des del ViewModel.
            // Estil del text per al valor objectiu.
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              letterSpacing: -1,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Padding al voltant del widget Slider.
          Padding(
            padding: const EdgeInsets.all(8.0),
            // Widget personalitzat del Slider.
            child: SliderWidget(
              value: _value, // Valor actual del slider.
              onChanged:
                  _onChanged, // Funció que s'executa quan el valor canvia.
              min: _MIN_VALUE, // Valor mínim del slider.
              max: _MAX_VALUE, // Valor màxim del slider.
            ),
          ),
          // Botó per enviar l'intent ("TRY").
          ElevatedButton(
            onPressed: _onPressed, // Funció que s'executa en prémer el botó.
            // Estil personalitzat per al botó.
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(48, 48), // Mida mínima del botó.
              backgroundColor: AppColors.primaryColor, // Color de fons.
              // Forma del botó amb cantonades arrodonides.
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
            ),
            // Text del botó.
            child: Text(
              "TRY",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ), // Estil del text.
            ),
          ),
        ],
      ),
    );
  }

  // Funció que s'executa quan el valor del slider canvia.
  void _onChanged(double value) {
    // Actualitza l'estat local del valor del slider i redibuixa el widget.
    setState(() {
      _value = value;
    });
  }

  // Funció que s'executa quan es prem el botó "TRY".
  void _onPressed() {
    // Obté el ViewModel sense escoltar canvis (només per cridar mètodes).
    var appState = Provider.of<ViewModel>(context, listen: false);
    // Calcula els punts basats en el valor actual del slider.
    appState.calculatePoints(_value);
    // Mostra un diàleg amb la puntuació obtinguda.
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Felicitats!"), // Títol del diàleg.
            content: Text(
              "Els teus punts són: ${appState.points}",
            ), // Contingut del diàleg.
            actions: [
              // Botó dins del diàleg per continuar.
              ElevatedButton(
                onPressed: () {
                  // Guarda la puntuació total actual com a marca.
                  appState.saveScore();
                  // Reinicia la ronda per obtenir un nou valor objectiu.
                  appState.reset();
                  // Força la reconstrucció del ContentView per mostrar el nou valor objectiu.
                  // Això és necessari perquè només `reset` notifica, però volem actualitzar immediatament.
                  setState(() {});
                  // Tanca el diàleg.
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }
}
