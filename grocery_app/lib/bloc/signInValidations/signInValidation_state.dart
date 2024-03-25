class ValidationState  {}

class SignInValidationSuccess extends ValidationState {
  final bool isAdmin;

  SignInValidationSuccess({required this.isAdmin});
}

class SignInValidationFailure extends ValidationState {
  String errorMessage;

  SignInValidationFailure({required this.errorMessage});
}

class InitialValidation extends ValidationState {
}
