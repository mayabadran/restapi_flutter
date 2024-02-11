import 'package:flutter/material.dart';
import 'package:get_all_data/model/error_model.dart';
import 'package:get_all_data/model/result_model.dart';
import 'package:get_all_data/model/user_model.dart';
import 'package:get_all_data/service/user_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExamService(),
    );
  }
}

class ExamService extends StatelessWidget {
  const ExamService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: serviceUI().getAllUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ResultModel> temp = snapshot.data as List<ResultModel>;
              if (temp is List<UserModel>) {
                return ListView.builder(
                    itemCount: temp.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: ()async{
                        await  serviceUI().DeletUser(temp[index].id);
                        },
                        leading: CircleAvatar(
                          child: Text((index + 1).toString()),
                        ),
                        title: Text(temp[index].username),
                        subtitle: Text(temp[index].email),
                        trailing: Text(temp[index].id.toString()),
                      );
                    });
              } else {
                return Center(
                  child: Text(temp.toString()),
                );
              }
            } else {
              return Center(
                child: LinearProgressIndicator(),
              );
            }
          }),
    );
  }
}
