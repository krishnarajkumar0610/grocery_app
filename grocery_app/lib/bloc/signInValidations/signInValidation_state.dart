import 'package:equatable/equatable.dart';

abstract class ValidationState extends Equatable {}

class SignInValidationSuccess extends ValidationState {
  final bool isAdmin;

  SignInValidationSuccess({required this.isAdmin});

  @override
  List<Object?> get props => [];
}

class SignInValidationFailure extends ValidationState {
  String errorMessage;

  SignInValidationFailure({required this.errorMessage});

  @override
  List<Object?> get props => [];
}

class InitialValidation extends ValidationState {
  @override
  List<Object?> get props => [];
}
