abstract class SignInEvent {}

class ValidateSignInFormEvent extends SignInEvent {
  String name;
  String password;

  ValidateSignInFormEvent({required this.name, required this.password});
}
