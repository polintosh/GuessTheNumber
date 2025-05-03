import 'package:flutter/material.dart';
import 'package:flutter_guess_the_number/view/Components/slider_widget.dart';
import 'package:flutter_guess_the_number/viewmodel/view_model.dart';
import 'package:flutter_guess_the_number/model/app_colors.dart';
import 'package:provider/provider.dart';

class ContentView extends StatefulWidget {
  const ContentView({super.key});

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  double _value = 50;
  // ignore: non_constant_identifier_names
  final double _MIN_VALUE = 1.0;
  // ignore: non_constant_identifier_names
  final double _MAX_VALUE = 100.0;
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ViewModel>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("🎯🎯🎯🎯", style: Theme.of(context).textTheme.headlineMedium),
          Text(
            "${appState.targetValue}",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              letterSpacing: -1,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SliderWidget(
              value: _value,
              onChanged: _onChanged,
              min: _MIN_VALUE,
              max: _MAX_VALUE,
            ),
          ),
          //Text("$_value"),
          ElevatedButton(
            onPressed: _onPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(48, 48),
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
            ),
            child: Text(
              "TRY",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _onChanged(double value) {
    setState(() {
      _value = value;
    });
  }

  void _onPressed() {
    var appState = Provider.of<ViewModel>(context, listen: false);
    appState.calculatePoints(_value);
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Congralutations"),
            content: Text("Your points are: ${appState.points}"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  // Save the current total score
                  appState.saveScore();
                  // Reset for the next round
                  appState.reset();
                  // Rebuild the content view to show new target value
                  setState(() {}); 
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }
}
