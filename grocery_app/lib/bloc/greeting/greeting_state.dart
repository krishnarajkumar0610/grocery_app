import 'package:equatable/equatable.dart';

abstract class GreetingState extends Equatable {}

class GetGreetingState extends GreetingState {
  String message;

  GetGreetingState({required this.message});

  @override
  List<Object?> get props => [];
}

class InitialGreeting extends GreetingState {
  @override
  List<Object?> get props => [];
}
