import 'package:equatable/equatable.dart';
import '../core/constants.dart';

abstract class TextToolEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProcessTextRequested extends TextToolEvent {
  final String text;
  final TextAction action;
  ProcessTextRequested({required this.text, required this.action});

  @override
  List<Object?> get props => [text, action];
}
