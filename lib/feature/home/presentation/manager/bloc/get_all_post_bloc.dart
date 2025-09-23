import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_clean_architecture/core/errors/failure.dart';
import 'package:news_clean_architecture/feature/home/domain/use_cases/get_all_post.dart';
import 'package:news_clean_architecture/feature/postes/domain/entities/post.dart';

part 'get_all_post_event.dart';
part 'get_all_post_state.dart';

class GetAllPostBloc extends Bloc<PostEvent, GetAllPostState> {
  final GetAllPosts posts;
  GetAllPostBloc({required this.posts}) : super(GetAllPostInitial()) {
    on<PostEvent>((event, emit) async {
      if (event is FetchAllPostsEvent) {
        emit(GetAllPostLoading());
        final failuerOrPosts = await posts.call();
        failuerOrPosts.fold(
          (failure) {
            emit(GetAllPostError(_MapFailureToMessage(failure)));
          },
          (posts) {
            emit(GetAllPostLoaded(posts));
          },
        );
      } else if (event is RefreshPostsEvent) {
        emit(GetAllPostLoading());
        final failuerOrPosts = await posts.call();
        failuerOrPosts.fold(
          (failure) => emit(GetAllPostError(_MapFailureToMessage(failure))),
          (posts) => emit(GetAllPostLoaded(posts)),
        );
      }
    });
  }
}

String _MapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return 'Please check your internet connection';
    case CacheFailure:
      return 'Cache Failure';
    default:
      return 'Please check your internet connection';
  }
}
