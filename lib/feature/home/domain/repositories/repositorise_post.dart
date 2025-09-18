import 'package:dartz/dartz.dart';
import 'package:news_clean_architecture/core/errors/failure.dart';
import 'package:news_clean_architecture/feature/postes/domain/entities/post.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Post>> getPostById(String id);
  Future<Either<Failure, Unit>> createPost(Post post);
  Future<Either<Failure, Unit>> updatePost(Post post);
  Future<Either<Failure, Unit>> deletePost(String id);

}
