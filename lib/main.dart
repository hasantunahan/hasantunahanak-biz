import 'package:flutter/material.dart';
import 'package:hasantunahanak_biz/home/view/home.dart';
import 'package:hasantunahanak_biz/theme/light_theme.dart';

void main() {
  runApp(const HasanTunahanApp());
}

class HasanTunahanApp extends StatelessWidget {
  const HasanTunahanApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hasan Tunahan AK",
      debugShowCheckedModeBanner: false,
      theme: MyLightTheme.theme,
      home: const HomePage(),
    );
  }
}
