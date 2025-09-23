import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}
class ServerFailure extends Failure {
  final String message;

  ServerFailure({this.message = ''});

  @override
  List<Object?> get props => [message];
}
class CacheFailure extends Failure {
  final String message;

  CacheFailure({this.message = 'Cache Failure'});

  @override
  List<Object?> get props => [message];
}
class NetworkFailure extends Failure {
  final String message;

  NetworkFailure({this.message = 'Please check your internet connection'});

  @override
  List<Object?> get props => [message];
}
class EmptyCacheException implements Exception {
  @override
  String toString() {
    return 'No cached data available';
  }
}

class ServerException extends Failure {
  final String message;

  ServerException({this.message = 'Server Failure'});

  @override
  List<Object?> get props => [message];
}