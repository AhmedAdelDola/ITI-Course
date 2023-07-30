import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Shared/Network/local/Cache%20helper.dart';
import 'package:untitled/modules/todo%20scrren/todoscreen.dart';

import 'Shared/Cubit/Appcubit.dart';
import 'Shared/Cubit/state.dart';

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
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..getData(),
    child: BlocConsumer<AppCubit,Appstate>(
        listener: (context, state) {},
    builder: (context, state) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: todoscreen() ,
    ),
    ),
    );
  }
}
