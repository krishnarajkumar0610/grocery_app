abstract class SignInEvent {}

class SignInValidationEvent extends SignInEvent {
  String name;
  String password;

  SignInValidationEvent({required this.name, required this.password});
}
