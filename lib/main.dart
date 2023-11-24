import 'package:aplicacion_1/cofig/go_router/router.dart';
import 'package:aplicacion_1/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    const AppState(),
  );
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    // incluimos el multiprovider al nivel mas alto posible para agregarlo al builtcontext
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StarNowPageProvider()),
        ChangeNotifierProvider(create: (_) => PerfilGroupProvidder()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
    );
  }
}
