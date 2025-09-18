part of 'get_all_post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}
final class RefreshPostsEvent extends PostEvent {}
final class FetchAllPostsEvent extends PostEvent {}

