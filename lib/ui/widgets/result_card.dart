import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultCard extends StatelessWidget {
  final String text;
  final bool isError;

  const ResultCard({super.key, required this.text, this.isError = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isError
          ? Theme.of(context).colorScheme.errorContainer
          : Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  isError ? 'Error' : 'Result',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Spacer(),
                if (!isError)
                  IconButton(
                    icon: const Icon(Icons.copy, size: 18),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Copied!')),
                      );
                    },
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(text),
          ],
        ),
      ),
    );
  }
}
