import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/Cubit/Appcubit.dart';
import '../../Shared/Cubit/state.dart';

class todo2 extends StatelessWidget {
  const todo2({Key? key, this.index}) : super(key: key);
  final index ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,Appstate>(
        listener: (context, state) {},
    builder: (context, state) {
         var Cubit = AppCubit().get(context);
      return Scaffold(
            appBar: AppBar(
              title: Text('${Cubit.users[index].title}'),
              centerTitle: true,
            ),
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('title : ${Cubit.users[index].title}'),
            Text('id : ${Cubit.users[index].id}'),
            Text('userId : ${Cubit.users[index].userId}'),
            Text('completed : ${Cubit.users[index].completed}'),
          ],
        )),
    );}
    );
  }
}
