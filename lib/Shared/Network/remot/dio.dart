


 import 'package:dio/dio.dart';
import 'package:untitled/models/todoModel.dart';

final Dio dio = Dio();
 Future<List<TodoMdel>> getData()async{
   List<TodoMdel> users = [] ;
      Response response;
      response = await dio.get(
      'https://jsonplaceholder.typicode.com/todos',
      );
    var data = response.data ;
    data.forEach((element) {
      TodoMdel user = TodoMdel.fromJson(element);
      users.add(user);
  return users ;
   });


   return users ;
      }
