import 'package:flutter/material.dart';
import 'package:untitled/Shared/Network/local/Cache%20helper.dart';

import '../next screen/Next.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    var formkey = GlobalKey<FormState>();
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
                    controller: pass,
                    validator: (value)  {
                      if (value == null || value.length < 8 ) {
                        return 'invalid email';
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
                          Cachhelper.putStting(key: 'email', value: email.text);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => next(),));
                        }
                      }, child: Text('Log in')),
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
                      onPressed: (){}, child: Text('No Account? Sign Up')),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
