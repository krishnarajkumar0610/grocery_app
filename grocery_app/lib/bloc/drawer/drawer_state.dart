import 'package:equatable/equatable.dart';

abstract class DrawerState extends Equatable {}

class LogoutState extends DrawerState {
  @override
  List<Object?> get props => [];
}

class DummyDrawerState extends DrawerState {
  @override
  List<Object?> get props => [];
}
