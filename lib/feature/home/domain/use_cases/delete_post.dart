import 'package:dartz/dartz.dart';
import 'package:news_clean_architecture/core/errors/failure.dart';
import 'package:news_clean_architecture/feature/home/domain/repositories/repositorise_post.dart';

 class DeletePost {
  DeletePost(this.repository);
  final PostRepository repository;
  Future<Either<Failure, Unit>> call(String id) async {
    return await repository.deletePost(id);
  }
}
