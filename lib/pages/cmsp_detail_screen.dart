// cmsp_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:stocet_learning_path/data/cmsp_data.dart';

class CMSPDetailScreen extends StatelessWidget {
  final CMSP cmsp;

  const CMSPDetailScreen({super.key, required this.cmsp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cmsp.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cmsp.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Licensed on: ${cmsp.licensedDate}',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text(cmsp.summary, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const Text(
              'Background',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text(cmsp.background, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const Text(
              'Goals',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text(cmsp.goals, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const Text(
              'Capital',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text(cmsp.capital, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
