import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/login%20screen/login.dart';

import '../../Shared/Cubit/Appcubit.dart';
import '../../Shared/Cubit/state.dart';

class signUp extends StatelessWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pass = TextEditingController();
    var email = TextEditingController();
    var formkey = GlobalKey<FormState>();

    return   BlocConsumer<AppCubit,Appstate>(
      listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit().get(context) ;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Image.asset('images/OIP.jpeg'),
                        SizedBox(height: 20,),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'invalid name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(label: Text('name')),),
                        SizedBox(height: 20,),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'invalid email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(label: Text('email')),),
                        SizedBox(height: 20,),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: pass,
                          validator: (value)  {
                            if (value == null || value.length < 8 ) {
                              return 'invalid password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(label: Text('password')),),
                        SizedBox(height: 20,),
                        ElevatedButton(
                            style: ButtonStyle(elevation: MaterialStatePropertyAll(10),
                                fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 50))
                            ),
                            onPressed: (){
                              if(formkey.currentState!.validate()){
                                cubit.firebaseSignUp(email.text, pass.text);
                                if(cubit.sucess == true){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login(),));
                                }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Sign Up faild'),));
                              }
                            }}, child: Text('Sign Up')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        );
  }
}
