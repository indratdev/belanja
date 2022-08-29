import 'package:belanja/Utils/routes.dart';
import 'package:belanja/state_management/supermarket_bloc/supermarket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  Routes routes = Routes();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SupermarketBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes.getRoutes,
        // initialRoute: '/splash',
      ),
    );
  }
}
