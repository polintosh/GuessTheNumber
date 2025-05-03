import 'package:flutter/material.dart';
import 'package:flutter_guess_the_number/viewmodel/view_model.dart';
import 'package:provider/provider.dart';

class MarksView extends StatelessWidget {
  const MarksView({super.key});

  @override
  Widget build(BuildContext context) {
    // The key difference between these two methods is:
    // Provider.of only gets the value once and doesn't update automatically
    // context.watch subscribes to changes and rebuilds the widget when ViewModel notifies changes
    final viewModel = context.watch<ViewModel>();
    final topMarks = viewModel.getTopMarks();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 5 Scores'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: ListView.builder(
        itemCount: topMarks.length,
        itemBuilder: (context, index) {
          final mark = topMarks[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  '#${index + 1}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                'Score: ${mark.score}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Date: ${mark.dateTime.toString().split('.')[0]}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
