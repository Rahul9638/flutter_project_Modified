import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapido_screen/cubit/login_cubit.dart';
import 'package:rapido_screen/data/network_service.dart';
import 'package:rapido_screen/data/repository.dart';
import 'package:rapido_screen/presentation/router.dart';

void main() {
  runApp(RapidoApp(
    router: AppRouter(), repository: Repository(networkService: NetworkService()),
  ));
}

class RapidoApp extends StatelessWidget {
  final AppRouter router;
  final Repository repository;
  const RapidoApp({Key? key, required this.router, required this.repository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(repository: repository))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
