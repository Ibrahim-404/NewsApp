import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_clean_architecture/core/network/network_chacker.dart';
import 'package:news_clean_architecture/feature/home/data/data_sources/local_data_source.dart';
import 'package:news_clean_architecture/feature/home/data/data_sources/remote_data_source.dart';
import 'package:news_clean_architecture/feature/home/domain/repositories/repositorise_post.dart';
import 'package:news_clean_architecture/feature/home/domain/use_cases/create_post.dart';
import 'package:news_clean_architecture/feature/home/domain/use_cases/delete_post.dart';
import 'package:news_clean_architecture/feature/home/domain/use_cases/get_all_post.dart';
import 'package:news_clean_architecture/feature/home/domain/use_cases/update_post.dart';
import 'package:news_clean_architecture/feature/home/presentation/manager/bloc/delete_update_create_bloc.dart';
import 'package:news_clean_architecture/feature/home/presentation/manager/bloc/get_all_post_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/home/data/repositories/news_repository.dart';


final  sl = GetIt.instance;

Future<void> setupInjection() async {
//Bloc
sl.registerFactory(() => DeleteUpdateCreateBloc(createPost: sl(), deletePost: sl(), updatePost: sl()));
sl.registerFactory(() => GetAllPostBloc(posts: sl()));
//UseCases
sl.registerLazySingleton(() => CreatePost(sl()));
sl.registerLazySingleton(() => DeletePost(sl()));
sl.registerLazySingleton(() => Update(sl()));
sl.registerLazySingleton(() => GetAllPosts(sl()));
//Repositorys
sl.registerLazySingleton<PostRepository>(() => PostRepositoryImplement(localDataSource: sl(), networkChecker: sl(), remoteDataSource: sl()));
//DataSources
sl.registerLazySingleton<PostLocalDataSource>(() => PostLocalDataSourceImpl(sl()));
sl.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceImpl(sl()));
///Core
sl.registerLazySingleton<NetworkChecker>(() => NetworkCheckerImpl(sl()));
///External
final sharedPreferences = await SharedPreferences.getInstance();
sl.registerLazySingleton(() => sharedPreferences);
sl.registerLazySingleton(() => Dio());
sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
}