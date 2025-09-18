import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/core/theme/manage/bloc/theme_bloc_bloc.dart';
import 'package:news_clean_architecture/feature/home/presentation/manager/bloc/delete_update_create_bloc.dart';
import 'package:news_clean_architecture/feature/home/presentation/manager/bloc/get_all_post_bloc.dart';
import 'package:news_clean_architecture/injection_container.dart' as di;
import 'core/routes/routes_setting.dart';
import 'feature/splash/presentation/pages/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupInjection();
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBlocBloc()),
        BlocProvider(
          create:
              (context) => di.sl<GetAllPostBloc>()..add(FetchAllPostsEvent()),
        ),
        BlocProvider(create: (context) => di.sl<DeleteUpdateCreateBloc>()),
      ],
      child: BlocBuilder<ThemeBlocBloc, ThemeBlocState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            home: Splashscreen(),
            onGenerateRoute: ManageRoutesSetting.generateRoute,
          );
        },
      ),
    );
  }
}
