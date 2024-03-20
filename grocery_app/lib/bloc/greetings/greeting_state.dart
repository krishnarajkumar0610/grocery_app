import 'package:equatable/equatable.dart';

abstract class GreetingState extends Equatable {}

class InitialGreeting extends GreetingState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetMyGreetingState extends GreetingState {
  String message;

  GetMyGreetingState({required this.message});

  @override
  List<Object?> get props => throw UnimplementedError();
}
