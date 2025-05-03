import 'package:flutter/material.dart';
import 'package:flutter_guess_the_number/model/app_colors.dart';
import 'package:flutter_guess_the_number/view/background_view.dart';
import 'package:flutter_guess_the_number/viewmodel/view_model.dart';
import 'package:flutter_guess_the_number/view/content_view.dart';
import 'package:provider/provider.dart';

// Punt d'entrada principal de l'aplicació Flutter.
void main() {
  // Inicia l'execució de l'aplicació amb el widget MainApp.
  runApp(const MainApp());
}

// Widget principal de l'aplicació.
class MainApp extends StatelessWidget {
  // Constructor del widget MainApp.
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider fa que l'instància de ViewModel estigui disponible
    // per a tots els widgets descendents en l'arbre de widgets.
    return ChangeNotifierProvider(
      // Crea una instància del ViewModel que gestiona l'estat del joc.
      create: (context) => ViewModel(),
      // MaterialApp és el widget arrel que configura l'aparença global de l'aplicació.
      child: MaterialApp(
        // Defineix el tema global de l'aplicació.
        theme: ThemeData(
          // Estableix el color de fons per defecte dels Scaffolds.
          scaffoldBackgroundColor: AppColors.backgroundColor,
          // Defineix l'esquema de colors basat en un color inicial (seed).
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue, // Color base per generar la paleta.
            brightness: Brightness.light, // Tema clar.
          ),
        ),
        // La pantalla inicial de l'aplicació.
        home: const Scaffold(
          // El cos del Scaffold conté un Stack per superposar widgets.
          body: Stack(
            children: [
              // Widget per mostrar el fons de l'aplicació.
              BackgroundView(),
              // Widget que mostra el contingut principal del joc (interfície).
              ContentView(),
            ],
          ),
        ),
      ),
    );
  }
}
