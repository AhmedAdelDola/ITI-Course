import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:untitled/Shared/Cubit/state.dart';
import '../../models/todoModel.dart';

class AppCubit extends Cubit<Appstate> {
  AppCubit() : super(initialState());
 AppCubit get(context) => BlocProvider.of(context);
  List<TodoMdel> users = [] ;
  final Dio dio = Dio();
  Future<List<TodoMdel>> getData()async{
    emit(loadingState());
    try{
    Response response;
    response = await dio.get(
      'https://jsonplaceholder.typicode.com/todos',
    );
    var data = response.data ;
    data.forEach((element) {
      TodoMdel user = TodoMdel.fromJson(element);
      users.add(user);
      emit(sucessState());
    });
  }catch(e){
      emit(errorState(e.toString()));
    }
    return users ;
  }
  bool? auth ;
  Future<bool> FirebaseSignin(String email , String password) async {
    emit(loginloadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(credential.user != null){
        emit(loginsucessState());
      return auth = true ;
      }
    } on FirebaseAuthException catch (e) {
      emit(loginerrorState(e.code));
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return auth = false ;
  }

 bool? sucess ;
  Future<bool> firebaseSignUp(String email , String password) async{
    emit(rejsterloadingState());
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(credential.user != null){
        emit(rejstersucessState());
       return sucess = false ;
      }
    } on FirebaseAuthException catch (e) {
      emit(rejstererrorState(e.code));
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return sucess = true ;
  }


}