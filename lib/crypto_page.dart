import 'package:flutter/material.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CryptoPage  page'),),
      body: Center(child: Text('CryptoPage')),
    );
  }
}