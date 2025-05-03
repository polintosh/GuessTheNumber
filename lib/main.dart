import 'package:flutter/material.dart';
import 'package:flutter_guess_the_number/Model/app_colors.dart';
import 'package:flutter_guess_the_number/View/background_view.dart';
import 'package:flutter_guess_the_number/ViewModel/view_model.dart';
import 'package:flutter_guess_the_number/View/content_view.dart';
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
        theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
        home: Scaffold(
          body: Stack(children: [const BackgroundView(), const ContentView()]),
        ),
      ),
    );
  }
}
