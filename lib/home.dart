import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text('Home page'),),
      body: Container(
        child:  Center(child: Column(children: [
          ElevatedButton(onPressed: () { 
          // GoRouter.of(context).go('/support/support_chat');
          GoRouter.of(context).goNamed('support');
         },
        child: Text('Support'),),
        ElevatedButton(onPressed: () { 
          // GoRouter.of(context).go('/support/support_chat');
          GoRouter.of(context).goNamed('crypto');
         },
        child: Text('Crypto'),)
        ],)),
      ),
    );
  }
}