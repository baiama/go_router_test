
import 'package:go_router/go_router.dart';
import 'package:routing/services/route_names.dart';

import '../crypto_page.dart';
import '../home.dart';
import '../login_info.dart';
import '../login_page.dart';
import '../support_chat.dart';
import '../support_page.dart';


GoRouter router(LoginInfo loginInfo) {
 return GoRouter(
       refreshListenable: loginInfo,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
      GoRoute(
        path: RouteNames.instance.login,
        name: RouteNames.instance.login,
        builder: (context, state) => const LoginPage(),  
      ),
      GoRoute(path: RouteNames.instance.support, 
      name: RouteNames.instance.support,
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
        name: RouteNames.instance.supportChat,
        path: '${RouteNames.instance.supportChat}/:guid', builder: (context, state) {
          final guid = state.params['guid'] ?? '' ; 
          final query = state.queryParams['query'] ?? '';
          final name = state.extra as String ;
          return SupportChatPage(guid: guid, name: name , query: query,);
        }),
    ],
      builder: (context, state) => const SupportPage(),),
      GoRoute(path: RouteNames.instance.crypto, 
      name: RouteNames.instance.crypto,
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
      builder: (context, state) => const CryptoPage(),),
      ]
      ),
     
    ],
  );
}
