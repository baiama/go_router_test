
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:routing/crypto_page.dart';
import 'package:routing/home.dart';
import 'package:routing/login_page.dart';
import 'package:routing/support_chat.dart';
import 'package:routing/support_page.dart';

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


GoRouter router(LoginInfo loginInfo) {
 return GoRouter(
       refreshListenable: loginInfo,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
      GoRoute(
        path: 'login',
        builder: (context, state) => LoginPage(),  
      ),
      GoRoute(path: 'support', 
      name: 'support',
      redirect: (state) {
      // if the user is not logged in, they need to login
      final loggedIn = loginInfo.loggedIn;
      final loggingIn = state.subloc == '/login';
      if (!loggedIn) return loggingIn ? null : '/login';

      // if the user is logged in but still on the login page, send them to
      // the support page
      if (loggingIn) return '/support';

      // no need to redirect at all
      return null;
    },
    routes: [
      GoRoute(
        name: 'support_chat',
        path: 'support_chat', builder: (context, state) => SupportChatPage()),
    ],
      builder: (context, state) => SupportPage(),),
      GoRoute(path: 'crypto', 
      name: 'crypto',
      redirect: (state) {
      // if the user is not logged in, they need to login
      final loggedIn = loginInfo.loggedIn;
      final loggingIn = state.subloc == '/login';
      if (!loggedIn) return loggingIn ? null : '/login';

      // if the user is logged in but still on the login page, send them to
      // the support page
      if (loggingIn) return '/crypto';

      // no need to redirect at all
      return null;
      },
      builder: (context, state) => CryptoPage(),),
      ]
      ),
     
    ],
  );
}