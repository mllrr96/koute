import 'package:flutter/material.dart';
import 'package:picked/app_router.dart';
import 'package:picked/core/theme.dart';
import 'package:picked/injection.dart';
import 'bloc_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProviders(
      child: MaterialApp.router(
        title: 'Picked',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
