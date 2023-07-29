import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Shared/Network/remot/dio.dart';

class todoscreen extends StatefulWidget {
  const todoscreen({Key? key}) : super(key: key);

  @override
  State<todoscreen> createState() => _todoscreenState();
}
class _todoscreenState extends State<todoscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) => ConditionalBuilder(
            condition: snapshot.hasData ,
            builder: (context) => ListView.separated(
              itemBuilder: (BuildContext context, int index) => ListTile(title: Text('${snapshot.data![index].title}',textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
              leading: CircleAvatar(child: Text('${snapshot.data![index].id}',textAlign: TextAlign.center,style: TextStyle(fontSize: 18)))),
              separatorBuilder: (BuildContext context, int index) => Container(height: 2 ,width: double.infinity,color: Colors.grey),
              itemCount: snapshot.data!.length,),
            fallback:(context) => Center(child: CircularProgressIndicator()) ,
        ),
      ),
    );
  }
}
