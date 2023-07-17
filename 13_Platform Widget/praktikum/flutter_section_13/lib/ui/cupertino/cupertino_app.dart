import 'package:flutter/cupertino.dart';

import './cupertino_page.dart';

class MainCupertinoApp extends StatelessWidget {
  const MainCupertinoApp({super.key});

  final _themeDart = const CupertinoThemeData.raw(
    Brightness.dark,
    null,
    null,
    null,
    null,
    null,
    null,
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: _themeDart,
      home: const HomePageCupertino(),
    );
  }
}
