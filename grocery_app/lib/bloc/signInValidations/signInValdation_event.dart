class ValidateEvents {}

class SignUpEvent extends ValidateEvents {}

class SignInEvent extends ValidateEvents {
  String name;
  String password;
  final context;

  SignInEvent(
      {required this.name, required this.password, required this.context});
}
