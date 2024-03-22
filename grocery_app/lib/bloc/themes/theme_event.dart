class ThemeEvent {}

class ChangeTheme extends ThemeEvent {
  bool fromLogout;

  ChangeTheme({required this.fromLogout});
}
