import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_clean_architecture/core/errors/failure.dart';
import 'package:news_clean_architecture/feature/home/domain/use_cases/create_post.dart';
import 'package:news_clean_architecture/feature/home/domain/use_cases/delete_post.dart';
import 'package:news_clean_architecture/feature/home/domain/use_cases/update_post.dart';
import 'package:news_clean_architecture/feature/postes/domain/entities/post.dart';

part 'delete_update_create_event.dart';
part 'delete_update_create_state.dart';

class DeleteUpdateCreateBloc
    extends Bloc<DeleteUpdateCreateEvent, DeleteUpdateCreateState> {

  final CreatePost createPost;
  final DeletePost deletePost;
  final Update updatePost;
  DeleteUpdateCreateBloc({required this.createPost, required this.deletePost, required this.updatePost}) : super(DeleteUpdateCreateInitial()) {
    on<DeleteUpdateCreateEvent>((event, emit) async {
      if (event is DeletePostEvent) {
        emit(LoadingProcessState());
        final result = await deletePost(event.postId);
        result.fold(
          (failure) => _MapFailureToMessage(failure),
          (success) => emit(SuccessProcessState('successfully deleted')),
        );
      } else if (event is UpdatePostEvent) {
        emit(LoadingProcessState());
        final result = await updatePost(event.post);
        result.fold(
          (failure) => emit(FailureProcessState(_MapFailureToMessage(failure))),
          (success) => emit(SuccessProcessState('successfully updated')),
        );
      } else if (event is CreatePostEvent) {
emit(LoadingProcessState());
        final result = await createPost(event.post);
        result.fold(
          (failure) => emit(FailureProcessState(_MapFailureToMessage(failure))),
          (success) => emit(SuccessProcessState("successfully created")),
        );
      }
    });
  }
}
String _MapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return 'Server Failure';
    case CacheFailure:
      return 'Cache Failure';
    default:
      return 'Unknown Failure';
  }
}