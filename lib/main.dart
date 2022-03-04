
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/services/router.dart';

import 'login_info.dart';

void main() {
  runApp( ChangeNotifierProvider(create: (context) => LoginInfo(),
  child: MyApp(),),);
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
    
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    
    return Consumer<LoginInfo>(
      builder: (BuildContext context, value, Widget? child) {  
        return MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
        
          primarySwatch: Colors.blue,
        ), routeInformationParser: router(value).routeInformationParser, routerDelegate: router(value).routerDelegate,
      );
      },
      
    );
  }

}