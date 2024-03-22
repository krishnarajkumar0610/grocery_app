import 'package:equatable/equatable.dart';

abstract class GreetingState extends Equatable {}

class MyGreetingState extends GreetingState {
  String? greeting;

  MyGreetingState({this.greeting});

  @override
  List<Object?> get props => [];
}
