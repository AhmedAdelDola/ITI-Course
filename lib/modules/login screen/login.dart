import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Shared/Network/local/Cache%20helper.dart';
import 'package:untitled/modules/rejster/rejster.dart';

import '../../Shared/Cubit/Appcubit.dart';
import '../../Shared/Cubit/state.dart';
import '../next screen/Next.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    var formkey = GlobalKey<FormState>();
    return   BlocConsumer<AppCubit,Appstate>(
        listener: (context, state) {},
    builder: (context, state) {
    var cubit = AppCubit().get(context) ;
          return  Scaffold(
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
                              return 'invalid email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(label: Text('password')),),
                        SizedBox(height: 20,),
                        ConditionalBuilder(
                          condition: state is! loginloadingState,
                          builder: (BuildContext context) => ElevatedButton(
                              style: ButtonStyle(elevation: MaterialStatePropertyAll(10),
                                  fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 50))
                              ),
                              onPressed: (){
                                if(formkey.currentState!.validate()){
                                  cubit.FirebaseSignin(email.text, pass.text);
                                  if(cubit.auth == true){
                                    Cachhelper.putStting(key: 'email', value: email.text);
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => next(),));
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Sign in faild'),));
                                  }
                                }
                              }, child: Text('Log in')),
                          fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),

                        ),
                        SizedBox(height: 40,),
                        Row(
                          children: [
                            Text('Forget password? No yawa.'),
                            Text('Tap me',style: TextStyle(color: Colors.blue)),
                          ],
                        ),
                        SizedBox(height: 70,),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Colors.grey),
                                fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 50))
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => signUp(),));
                            }, child: Text('No Account? Sign Up')),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          );

});
  }
}
