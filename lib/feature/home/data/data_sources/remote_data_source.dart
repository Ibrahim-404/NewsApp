import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_clean_architecture/core/errors/failure.dart';
import 'package:news_clean_architecture/feature/postes/data/model/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> fetchAllPosts();
  Future<PostModel> fetchPostById(String id);
  Future<Unit> createPost(PostModel post);
  Future<Unit> updatePost(PostModel post);
  Future<Unit> deletePost(String id);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final Dio _dio;
  final String baseUrl = "https://jsonplaceholder.typicode.com";
  late final Response response;
  PostRemoteDataSourceImpl(this._dio);
  @override
  Future<List<PostModel>> fetchAllPosts() async {
     response = await _dio.get(
      '$baseUrl/posts/',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        validateStatus: (status) => status != null && status < 500,
      ),
    );
    if (response.statusCode == 200) {
      final List<PostModel> posts =
          (response.data as List)
              .map((post) => PostModel.fromJson(post))
              .toList();
      return posts;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PostModel> fetchPostById(String id) async {
    final response = await _dio.get('$baseUrl/posts/$id');
    if (response.statusCode == 200) {
      return PostModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> createPost(PostModel post) async {
    final response = await _dio.post('$baseUrl/posts', data: post.toJson());
    if (response.statusCode == 201) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel post) async {
    final response = await _dio.put(
      '$baseUrl/posts/${post.id}',
      data: post.toJson(),
    );
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost(String id) async {
    final response = await _dio.delete('$baseUrl/posts/$id');
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  // throw ();
}
