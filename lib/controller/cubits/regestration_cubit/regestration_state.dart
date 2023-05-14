part of 'regestration_cubit.dart';

abstract class RegestrationState {}

class RegestrationInitial extends RegestrationState {}

class RegestrationLoding extends RegestrationState {}

class RegestrationSuccess extends RegestrationState {
  final String successMessage;
  RegestrationSuccess({required this.successMessage});
}

class RegestrationFailure extends RegestrationState {
  final String failureMessage;
  RegestrationFailure({required this.failureMessage});
}
