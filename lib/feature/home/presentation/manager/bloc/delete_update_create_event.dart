part of 'delete_update_create_bloc.dart';

sealed class DeleteUpdateCreateEvent extends Equatable {
  const DeleteUpdateCreateEvent();

  @override
  List<Object> get props => [];
}
class DeletePostEvent extends DeleteUpdateCreateEvent {
  final String postId;

  const DeletePostEvent(this.postId);

  @override
  List<Object> get props => [postId];
}
class UpdatePostEvent extends DeleteUpdateCreateEvent {
 final Post post;

  const UpdatePostEvent(this.post);

  @override
  List<Object> get props => [post];
}
class CreatePostEvent extends DeleteUpdateCreateEvent {
  final Post post;

  const CreatePostEvent(this.post);

  @override
  List<Object> get props => [post];
}
