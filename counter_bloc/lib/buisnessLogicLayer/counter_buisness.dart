import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/data_layer/counter_bloc.dart';
import '../PresntationLayer/counter_page.dart';
class CounterApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: BlocProvider(
        create: (_)=> CounterBloc(),
        child: CounterPage(),
      ),
      
    );
  }
}