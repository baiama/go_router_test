import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'login_info.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Login page'),),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // log a user in, letting all the listeners know
              
              context.read<LoginInfo>().login('test-user');

              // go home
              context.go('/support');
            },
            child: const Text('Login'),
          ),
        ],
      ),
    ),
    );
  }
}