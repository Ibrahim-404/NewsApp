  import 'dart:convert';

  import 'package:dartz/dartz.dart';
  import 'package:news_clean_architecture/core/errors/failure.dart';
  import 'package:news_clean_architecture/feature/postes/data/model/post_model.dart';
  import 'package:shared_preferences/shared_preferences.dart';

  abstract class PostLocalDataSource {
    Future<List<PostModel>> getCachedPosts();
    Future<Unit> cachePosts(List<PostModel> postes);
  }

  class PostLocalDataSourceImpl implements PostLocalDataSource {
    final SharedPreferences _sharedPreferences;

    PostLocalDataSourceImpl(this._sharedPreferences);

    @override
    Future<List<PostModel>> getCachedPosts() {
      final jsonString = _sharedPreferences.getString('cached_posts');
      if (jsonString != null) {
        List CachedPosts = json.decode(jsonString);
        final List<PostModel> posts = CachedPosts.map((post) => PostModel.fromJson(post)).toList();
        return Future.value(posts);
      } else {
        throw EmptyCacheException();
      }
    }

    @override
    Future<Unit> cachePosts(List<PostModel> postes) async {
      final PostModelToJson =
          postes.map<Map<String, dynamic>>((post) => post.toJson()).toList();
      await _sharedPreferences.setString(
        'cached_posts',
        json.encode(PostModelToJson),
      );
      return Future.value(unit);
    }
  }
