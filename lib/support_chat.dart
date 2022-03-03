import 'package:flutter/material.dart';

class SupportChatPage extends StatelessWidget {
  final String name;
  final String guid;
  final String query;
  const SupportChatPage({ Key? key, required this.name, required this.guid, required this.query }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Support chat '),),
      body: Center(child: Text('name = $name  guid=$guid  query=$query')),
    );
  }
}