import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_section_23/pages/home_screen.dart';
import 'package:flutter_section_23/pages/register_screen.dart';

import '../bloc/register_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter App with Storage',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: RegisterScreen.route,
          routes: {
            HomeScreen.route: (context) => const HomeScreen(),
            RegisterScreen.route: (context) => const RegisterScreen(),
          }),
    );
  }
}
