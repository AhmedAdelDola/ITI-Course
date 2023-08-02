import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Shared/Cubit/state.dart';

import '../../Shared/Cubit/Appcubit.dart';

class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
    var formkey = GlobalKey<FormState>();
    return  BlocConsumer<AppCubit,Appstate>(
        listener: (context, state) {},
    builder: (context, state) {
    var cubit = AppCubit().get(context) ;
        return Scaffold(
            body: Column(children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'invalid name';
                  }
                  return null;
                },
                decoration: InputDecoration(label: Text('email')),),
              SizedBox(height: 20,),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: phone,
                validator: (value)  {
                  if (value == null || value.length < 12 ) {
                    return 'invalid phone';
                  }
                  return null;
                },
                decoration: InputDecoration(label: Text('password')),),
              SizedBox(height: 20,),
              ConditionalBuilder(
                condition: state is! getloadingState,
                builder: (BuildContext context) => ElevatedButton(
                    style: ButtonStyle(elevation: MaterialStatePropertyAll(10),
                        fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 50))
                    ),
                    onPressed: (){
                      if(formkey.currentState!.validate()){
                        cubit.addUser(name.text, phone.text);
                      }

                    }, child: Text('Log in')), fallback: (BuildContext context) { return CircularProgressIndicator(); },
              ),])
        );
        });


  }
}
