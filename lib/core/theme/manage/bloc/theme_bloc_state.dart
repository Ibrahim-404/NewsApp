    part of 'theme_bloc_bloc.dart';

    @immutable
  
final class ThemeBlocState {
  final bool isDark;
  final ThemeData themeData;

  const ThemeBlocState({
    required this.isDark,
    required this.themeData,
  });
}

