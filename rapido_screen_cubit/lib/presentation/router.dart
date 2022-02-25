import 'package:flutter/material.dart';
import 'package:rapido_screen/constant/strings.dart';
import 'package:rapido_screen/cubit/login_cubit.dart';
import 'package:rapido_screen/cubit/otp_cubit.dart';
import 'package:rapido_screen/data/models/login_model.dart';
import 'package:rapido_screen/data/network_service.dart';
import 'package:rapido_screen/data/repository.dart';
import 'package:rapido_screen/presentation/screens/information_screen.dart';
import 'package:rapido_screen/presentation/screens/otp_screen.dart';

import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late Repository repository;
  late LoginCubit loginCubit;

  AppRouter() {
    repository = Repository(networkService: NetworkService());
    loginCubit = LoginCubit(repository: repository);
  }
  MaterialPageRoute? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case LOGIN_SCREEN_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            // create: (BuildContext context) =>
            //     LoginCubit(repository: repository),
            value: loginCubit,
            child: LoginScreen(),
          ),
        );
      case OTP_SCREEN_ROUTE:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                OtpCubit(repository: repository, loginCubit: loginCubit),
            child: OtpScreen(),
          ),
        );
      case INFORMATION_SCREEN_ROUTE:  
        return MaterialPageRoute(builder:((context) => InformationScreen()) );
    }
  }
}
