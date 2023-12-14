import 'dart:ui';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manjaro_hello/presentation/widgets/app.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
  // Add this code below

  doWhenWindowReady(() {
    const initialSize = Size(1200, 800);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: FluentThemeData.dark(),
      scrollBehavior:
          ScrollConfiguration.of(context).copyWith(scrollbars: false),
      home: App(),
    );
  }
}
