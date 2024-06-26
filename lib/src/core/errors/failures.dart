import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class LocalDbFailure extends Failure {
  const LocalDbFailure(super.errorMessage);
}

class GoogleApiBooksFailure extends Failure {
  const GoogleApiBooksFailure(super.errorMessage);
}

class GoogleApiBookNotFoundFailure extends Failure {
  const GoogleApiBookNotFoundFailure() : super('');
}
