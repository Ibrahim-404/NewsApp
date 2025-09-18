part of 'get_all_post_bloc.dart';

sealed class GetAllPostState extends Equatable {
  const GetAllPostState();
  
  @override
  List<Object> get props => [];
}

final class GetAllPostInitial extends GetAllPostState {}
final class GetAllPostLoading extends GetAllPostState {}
final class GetAllPostLoaded extends GetAllPostState {
  final List<Post> posts;

  const GetAllPostLoaded(this.posts);

  @override
  List<Object> get props => [posts];
}
final class GetAllPostError extends GetAllPostState {
  final String message;

  const GetAllPostError(this.message);

  @override
  List<Object> get props => [message];
}
