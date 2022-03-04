
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing/services/route_names.dart';


class NavigationService {
  static void showSupportPage(BuildContext context, {required String name, bool isPush = true}){
    if(isPush){
      GoRouter.of(context).push(RouteNames.instance.support);  
    }else {
      GoRouter.of(context).go(RouteNames.instance.support);    
    }
  }

  /// GoRouter.of(context).pushNamed just push 
  /// Example:
  /// ScreenA, ScreenB, ScreenC,
  /// ScreenC is subRoute of ScreenB
  /// from ScreenA GoRouter.of(context).pushNamed('/ScreenC')
  /// on pop will be back to ScreenA
  /// from ScreenA GoRouter.of(context).goNamed('/ScreenC')
  /// on pop will be back to ScreenB, then back to ScreenA
  static void showSupportChatPage(BuildContext context, {bool isPush = true, required String name, required String query, required String guid}){
    if(isPush){
      GoRouter.of(context).pushNamed(RouteNames.instance.supportChat, extra: name,
        params: {'guid': guid}, 
        queryParams: {'query': query},);  
    }else {
       GoRouter.of(context).goNamed(RouteNames.instance.supportChat, extra: name,
        params: {'guid': guid}, 
        queryParams: {'query': query}
       ); 
       
    }
  }
}