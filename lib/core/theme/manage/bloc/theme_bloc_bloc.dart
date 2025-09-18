import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_clean_architecture/core/theme/app_theme.dart';

part 'theme_bloc_event.dart';
part 'theme_bloc_state.dart';

class ThemeBlocBloc extends Bloc<ThemeBlocEventToggle, ThemeBlocState> {
  ThemeBlocBloc() : super(ThemeBlocState(isDark: false, themeData: AppTheme.light)) {
    on<ThemeBlocEventToggle>((event, emit) {
      emit(ThemeBlocState(isDark: !state.isDark, themeData: state.isDark ? AppTheme.light : AppTheme.dark));
    });

  
  }
}
