import 'package:equatable/equatable.dart';

abstract class GreetingState extends Equatable {}

class InitialGreeting extends GreetingState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetGreetingState extends GreetingState {
  String getGreeting;

  GetGreetingState({required this.getGreeting}) {
    print("INGA VANTEA : $getGreeting");
  }

  @override
  List<Object?> get props => [];
}
