import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/routes_name.dart';
part 'manage_splash_screen_state.dart';

class ManageSplashScreenCubit extends Cubit<ManageSplashScreenState> {
  ManageSplashScreenCubit() : super(ManageSplashScreenInitial());

  Future<void>changeScreen(buildContext)async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushNamedAndRemoveUntil(buildContext,RoutesName.homeScreen , (route) => false);
  }
}
