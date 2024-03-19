import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {}

class InitialSignInState extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInValidationSuccessState extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInValidationFailureState extends SignInState {
  String message;

  SignInValidationFailureState({required this.message});

  @override
  List<Object?> get props => [];
}
