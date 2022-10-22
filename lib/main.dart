import 'package:flutter/material.dart';
import 'package:hasantunahanak_biz/home/view/home.dart';
import 'package:hasantunahanak_biz/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) {
          return ThemeProvider();
        })),
      ],
      child: const HasanTunahanApp(),
    ),
  );
}

class HasanTunahanApp extends StatelessWidget {
  const HasanTunahanApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hasan Tunahan AK",
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeProvider>().currentTheme,
      home: const HomePage(),
    );
  }
}
