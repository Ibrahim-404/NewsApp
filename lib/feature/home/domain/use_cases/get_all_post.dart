import 'package:dartz/dartz.dart';
import 'package:news_clean_architecture/core/errors/failure.dart';
import 'package:news_clean_architecture/feature/home/domain/repositories/repositorise_post.dart';
import 'package:news_clean_architecture/feature/postes/domain/entities/post.dart';

 class GetAllPosts {
  GetAllPosts(this.repository);
  final PostRepository repository;
  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}
