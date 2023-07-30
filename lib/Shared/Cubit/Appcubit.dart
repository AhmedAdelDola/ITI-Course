import 'package:bloc/bloc.dart';
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
}