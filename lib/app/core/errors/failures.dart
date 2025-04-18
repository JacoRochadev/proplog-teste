import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});

  @override
  List<Object> get props => [message];
}

class FileNotFoundFailure extends Failure {
  const FileNotFoundFailure({required super.message});

  @override
  List<Object> get props => [message];
}
