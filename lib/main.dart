import 'package:flutter/material.dart';
import 'package:flutter_guess_the_number/model/app_colors.dart';
import 'package:flutter_guess_the_number/view/background_view.dart';
import 'package:flutter_guess_the_number/viewmodel/view_model.dart';
import 'package:flutter_guess_the_number/view/content_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModel(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColor,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.light,
          ),
        ),
        home: const Scaffold(
          body: Stack(
            children: [
              BackgroundView(),
              ContentView(),
            ],
          ),
        ),
      ),
    );
  }
}
