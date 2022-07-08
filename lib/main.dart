import 'package:catalog_app/core/my_store.dart';
import 'package:catalog_app/pages/cart_page.dart';
import 'package:catalog_app/pages/home_details.dart';
import 'package:catalog_app/pages/home_page.dart';
import 'package:catalog_app/pages/login_page.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(
        routes: {
          "/": (_, __) => const MaterialPage(child: LoginPage()),
          MyRoutes.homeRoute: (_, __) => const MaterialPage(child: HomePage()),
          MyRoutes.homeDetailsRoute: (uri, params) {
            // final catalog = (VxState.store as MyStore).catalog.getById(
            //        int.parse(uri.queryParameters["id"]),
            //     );
            return MaterialPage(
              child: HomeDetailPage(
                catalog: params,
              ),
            );
          },
          MyRoutes.loginRoute: (_, __) =>
              const MaterialPage(child: LoginPage()),
          MyRoutes.cartRoute: (_, __) => const MaterialPage(
                child: CartPage(),
              ),
        },
      ),
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => HomePage(),
      //   MyRoutes.loginRoute: (context) => const LoginPage(),
      //   MyRoutes.homeRoute: (context) => HomePage(),
      //   MyRoutes.cartRoute: (context) => const CartPage(),
      // },
    );
  }
}
