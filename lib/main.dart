import 'package:c_commerce_bloc_api_call/src/features/auth/bloc/auth_bloc.dart';
import 'package:c_commerce_bloc_api_call/src/features/home/bloc/home_bloc.dart';
import 'package:c_commerce_bloc_api_call/src/route/route.gr.dart';
import 'package:c_commerce_bloc_api_call/src/util/local_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.initialize();
  runApp(const MyApp());
}

AppRouter appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AuthBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => HomeBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
        title: 'E-Commerce App',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          appBarTheme: const AppBarTheme(elevation: 0),
        ),
      ),
    );
  }
}
