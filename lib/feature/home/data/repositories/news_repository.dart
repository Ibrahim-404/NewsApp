import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:news_clean_architecture/core/errors/failure.dart';
import 'package:news_clean_architecture/core/network/network_chacker.dart';
import 'package:news_clean_architecture/feature/home/data/data_sources/local_data_source.dart';
import 'package:news_clean_architecture/feature/home/data/data_sources/remote_data_source.dart';
import 'package:news_clean_architecture/feature/home/domain/repositories/repositorise_post.dart';
import 'package:news_clean_architecture/feature/postes/data/model/post_model.dart';
import 'package:news_clean_architecture/feature/postes/domain/entities/post.dart';

class PostRepositoryImplement implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkChecker networkChecker;

  PostRepositoryImplement({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkChecker,
  });

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkChecker.isConnected) {
      try {
        final remotePostModels = await remoteDataSource.fetchAllPosts();
        final remotePosts =
            remotePostModels.map((postModel) => postModel.toEntity()).toList();

        // Cache the data locally
        await localDataSource.cachePosts(remotePostModels);

        return Right(remotePosts);
      } catch (e) {
        try {
          final localPostModels = await localDataSource.getCachedPosts();
          final localPosts = localPostModels.map((postModel) => postModel.toEntity()).toList();
          return Right(localPosts);
        } catch (_) {
          return Left(CacheFailure());
        }
      }
    } else {
      try {
        final localPostModels = await localDataSource.getCachedPosts();
        final localPosts = localPostModels.map((postModel) => postModel.toEntity()).toList();
        return Right(localPosts);
      } catch (_) {
        return Left(NetworkFailure()); 
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> createPost(Post post) async {
    if (await networkChecker.isConnected) {
      try {
        final postModel = PostModel.fromEntity(post);
        await remoteDataSource.createPost(postModel);
        return Right(unit);
      } catch (e) {
        log('Error creating post: $e');
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> getPostById(String id) async {
    if (await networkChecker.isConnected) {
      try {
        final remotePostModel = await remoteDataSource.fetchPostById(id);
        return Right(remotePostModel.toEntity());
      } catch (e) {
        log('Error fetching post by id: $e');
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost(String id) async {
    if (await networkChecker.isConnected) {
      try {
        await remoteDataSource.deletePost(id);
        return Right(unit);
      } catch (e) {
        log('Error deleting post: $e');
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    if (await networkChecker.isConnected) {
      try {
        final postModel = PostModel.fromEntity(post);
        await remoteDataSource.updatePost(postModel);
        return Right(unit);
      } catch (e) {
        log('Error updating post: $e');
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
