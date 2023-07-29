import 'package:flutter/material.dart';
import 'package:untitled/Shared/Network/local/Cache%20helper.dart';
import 'package:untitled/modules/todo%20scrren/todoscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cachhelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: todoscreen() ,
    );
  }
}
