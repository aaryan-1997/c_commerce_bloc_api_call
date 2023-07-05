import 'package:auto_route/auto_route.dart';
import 'package:c_commerce_bloc_api_call/src/features/auth/view/login_page.dart';
import 'package:c_commerce_bloc_api_call/src/features/home/view/home_page.dart';
import 'package:c_commerce_bloc_api_call/src/features/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: HomePage),
  ],
)
class $AppRouter {}
