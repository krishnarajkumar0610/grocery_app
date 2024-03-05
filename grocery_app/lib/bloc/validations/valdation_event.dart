class ValidateEvents {}

class SignUpEvent extends ValidateEvents {}

class SignInEvent extends ValidateEvents {
  String name;
  String password;

  SignInEvent({required this.name, required this.password});
}
