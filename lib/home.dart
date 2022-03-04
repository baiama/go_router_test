import 'package:flutter/material.dart';
import 'package:routing/services/navigation_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text('Home page'),),
      body: Container(
        child:  Center(child: Column(children: [
          ElevatedButton(onPressed: () { 
          NavigationService.showSupportPage(context, name: 'name');
         },
        child: Text('Support chat '),),
         ElevatedButton(onPressed: () { 
          NavigationService.showSupportChatPage(context, name: 'name', guid: 'guid', query: 'query', isPush: false);
         },
        child: Text('Support chat with path on linking' ),),
        ElevatedButton(onPressed: () { 
         NavigationService.showSupportChatPage(context, name: 'name', guid: 'guid', query: 'query');
          
         },
        child: Text('Support chat just push'),)
        ],)),
      ),
    );
  }
}