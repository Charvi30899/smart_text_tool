import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/text_tool_bloc.dart';
import '../bloc/text_tool_event.dart';
import '../bloc/text_tool_state.dart';
import '../core/constants.dart';
import 'widgets/action_selector.dart';
import 'widgets/result_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  TextAction _selectedAction = TextAction.summarize;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    context.read<TextToolBloc>().add(
      ProcessTextRequested(text: text, action: _selectedAction),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smart Text Tool')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Enter your text here...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ActionSelector(
              selected: _selectedAction,
              onChanged: (action) => setState(() => _selectedAction = action),
            ),
            const SizedBox(height: 12),
            FilledButton(onPressed: _submit, child: const Text('Process')),
            const SizedBox(height: 20),
            BlocBuilder<TextToolBloc, TextToolState>(
              builder: (context, state) {
                if (state is TextToolLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TextToolSuccess) {
                  return ResultCard(text: state.result);
                } else if (state is TextToolFailure) {
                  return ResultCard(text: state.error, isError: true);
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
