import 'package:dartz/dartz.dart';
import 'package:news_clean_architecture/core/errors/failure.dart';
import 'package:news_clean_architecture/feature/home/domain/repositories/repositorise_post.dart';
import 'package:news_clean_architecture/feature/postes/domain/entities/post.dart';

 class Update {
  Update(this.repository);
  final PostRepository repository;
  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.updatePost(post);
  }
}
