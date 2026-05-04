import 'package:equatable/equatable.dart';

abstract class TextToolState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TextToolInitial extends TextToolState {}
class TextToolLoading extends TextToolState {}

class TextToolSuccess extends TextToolState {
  final String result;
  TextToolSuccess(this.result);
  @override
  List<Object?> get props => [result];
}

class TextToolFailure extends TextToolState {
  final String error;
  TextToolFailure(this.error);
  @override
  List<Object?> get props => [error];
}
