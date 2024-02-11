import 'package:dio/dio.dart';
import 'package:get_all_data/model/error_model.dart';
import 'package:get_all_data/model/result_model.dart';
import 'package:get_all_data/model/user_model.dart';

abstract class UserService {
  Dio dio= Dio();
  String baseUrl='https://jsonplaceholder.typicode.com/users';
  late Response response;
  Future<List<ResultModel>> getAllUser();
  Future<ResultModel> getOneUser();
  createUser(UserModel user);
  DeletUser(int id);
}
class serviceUI extends UserService {
  @override
  DeletUser(int id)async {
    response=  await dio.delete(baseUrl +"/${id}");

    if(response.statusCode == 200){
      print("\$");
    }
  }

  @override
  createUser(user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<List<ResultModel>> getAllUser()async{
   try {
     response=await dio.get(baseUrl);
     if (response.statusCode==200) {
       List<UserModel> usermodel =  List.generate(response.data.length, (index) =>UserModel.fromMap(response.data[index]) );
    return usermodel;
     }else{
      return[ErrorModel(message: "no internet"),];
     }
   } catch (e) {
       return[ErrorModel(message: "no internet"),];
   }
  }

  @override
  Future<ResultModel> getOneUser() {
    // TODO: implement getOneUser
    throw UnimplementedError();
  }
  
}