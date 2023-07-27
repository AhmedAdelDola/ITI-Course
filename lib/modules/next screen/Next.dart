import 'package:flutter/material.dart';
import 'package:untitled/Shared/Network/local/Cache%20helper.dart';

class next extends StatelessWidget {
  const next({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String? email = Cachhelper.getString(key: 'email');
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      title: Text('Next Page')),
      body: Center(child: Text('my email is \n $email',style: TextStyle(fontSize: 25),textAlign: TextAlign.center,)),
    );
  }
}
