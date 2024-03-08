import 'package:equatable/equatable.dart';

abstract class ValidationState extends Equatable {}

class ValidationSuccess extends ValidationState {
  final bool isAdmin;

  ValidationSuccess({required this.isAdmin});

  @override
  List<Object?> get props => [];
}

class InitialValidation extends ValidationState {
  @override
  List<Object?> get props => [];
}
