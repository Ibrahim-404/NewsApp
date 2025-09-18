part of 'delete_update_create_bloc.dart';

sealed class DeleteUpdateCreateState extends Equatable {
  const DeleteUpdateCreateState();

  @override
  List<Object> get props => [];
}

final class DeleteUpdateCreateInitial extends DeleteUpdateCreateState {}

class SuccessProcessState extends DeleteUpdateCreateState {
 final  String message;

  const SuccessProcessState(this.message);
}
class FailureProcessState extends DeleteUpdateCreateState {
  final 
  String message;

  const FailureProcessState(this.message);
}
class LoadingProcessState extends DeleteUpdateCreateState {}