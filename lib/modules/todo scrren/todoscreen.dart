
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Shared/Cubit/Appcubit.dart';
import 'package:untitled/Shared/Cubit/state.dart';
import 'package:untitled/modules/todo%20info/todoinfo.dart';


class todoscreen extends StatefulWidget {
  const todoscreen({Key? key}) : super(key: key);

  @override
  State<todoscreen> createState() => _todoscreenState();
}
class _todoscreenState extends State<todoscreen> {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,Appstate>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit().get(context) ;
          return Scaffold(
            appBar: AppBar(),
            body: ConditionalBuilder(
              condition: state is! loadingState ,
              builder: (context) =>
                  ListView.separated(
                    itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => todo2(index: index),));
                      },
                      child: ListTile(title: Text('${cubit.users[index].title}',textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                          leading: CircleAvatar(child: Text('${cubit.users[index].id}',textAlign: TextAlign.center,style: TextStyle(fontSize: 18)))),
                    ),
                    separatorBuilder: (BuildContext context, int index) => Container(height: 2 ,width: double.infinity,color: Colors.grey),
                    itemCount: cubit.users.length,),
              fallback:(context) => Center(child: CircularProgressIndicator()) ,
            ),
          );
        }


        );




  }
}
