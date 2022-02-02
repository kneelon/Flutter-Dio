import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio/http_services.dart';
import 'package:flutter_dio/main.dart';
import 'package:flutter_dio/model/single_user_response.dart';
import 'package:flutter_dio/model/user.dart';

class SingleUserScreen extends StatefulWidget {
  const SingleUserScreen({Key? key}) : super(key: key);

  @override
  _SingleUserScreenState createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {

  late HttpServices http;

  late SingleUserResponse singleUserResponse;
  late User user;

  late bool isLoading;

  //36:00
  Future getUser() async{
    Response response;
    try {
      isLoading = true;
      response = await http.getRequest("https://reqres.in/api/users/9");
      isLoading = false;
      // HttpOverrides.global = MyHttpOverrides();
      if(response.statusCode == 200){
        setState(() {
          print('Success');
          singleUserResponse = SingleUserResponse.fromJson(response.data);
          user = singleUserResponse.user;
        });
      }else {
        print('There is some problem');
      }
    } on Exception catch (e) {
      isLoading = false;
      print(e);
    }
  }

  //45:00 playing fine
  @override
  //45:42 pause
  void initState() {

    http = HttpServices();
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter MCU'),
        centerTitle: true,
      ),
      body: isLoading ?  Center(child: CircularProgressIndicator())
          : Container(
        width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/round_logo.png', height: 120.0, width: 120.0,),
              SizedBox(height: 100,),
              Image.network(user.avatar),
              Container(height: 8,),
              Text('Hello ${user.firstName} ${user.lastName}', style: TextStyle(color: Colors.black54, fontSize: 24.0)),
              SizedBox(height: 8,),
              Text('Email: ${user.email}' ,style: TextStyle(color: Colors.blue, fontSize: 18.0),),
            ],
          ),
      ),
    );
  }
}
