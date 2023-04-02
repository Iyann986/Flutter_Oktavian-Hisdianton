import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_section_22_animation/bloc/contact_bloc.dart';
import 'package:flutter_section_22_animation/pages/contact_create.dart';
import 'package:flutter_section_22_animation/pages/home_contact.dart';

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
          create: (_) => ContactBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Animation',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => const HomeContact(),
          '/createContact': (context) => const ContactCreate(),
        },
      ),
    );
  }
}
