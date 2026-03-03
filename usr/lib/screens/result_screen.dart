import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final description = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wygenerowany Opis'),
        actions: [
          IconButton(
            icon: const Icon(Icons.copy),
            tooltip: 'Kopiuj do schowka',
            onPressed: () {
              Clipboard.setData(ClipboardData(text: description));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Skopiowano do schowka')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: SelectableText(
                description,
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
