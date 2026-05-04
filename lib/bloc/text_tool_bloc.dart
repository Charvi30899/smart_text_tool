import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/gemini_repository.dart';
import 'text_tool_event.dart';
import 'text_tool_state.dart';

class TextToolBloc extends Bloc<TextToolEvent, TextToolState> {
  final GeminiRepository _repository;

  TextToolBloc(this._repository) : super(TextToolInitial()) {
    on<ProcessTextRequested>(_onProcessText);
  }

  Future<void> _onProcessText(
    ProcessTextRequested event,
    Emitter<TextToolState> emit,
  ) async {
    emit(TextToolLoading());
    try {
      final result = await _repository.processText(event.text, event.action);
      emit(TextToolSuccess(result));
    } catch (e) {
      emit(TextToolFailure(e.toString()));
    }
  }
}
