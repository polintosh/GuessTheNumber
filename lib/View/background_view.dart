import 'package:flutter/material.dart';
import 'package:flutter_guess_the_number/view/components/marks_view.dart';
import 'package:flutter_guess_the_number/view/components/number_view.dart';
import 'package:flutter_guess_the_number/view/components/rounded_view.dart';
import 'package:flutter_guess_the_number/viewmodel/view_model.dart';
import 'package:provider/provider.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ViewModel>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 40),
      child: Column(
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  appState.restartGame();
                },
                child: RoundedView(icon: Icons.refresh),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MarksView()),
                  );
                },
                child: RoundedView(icon: Icons.list),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              NumberView(text: "SCORE", value: appState.score),
              Spacer(),
              NumberView(text: "ROUND", value: appState.rounds),
            ],
          ),
        ],
      ),
    );
  }
}
