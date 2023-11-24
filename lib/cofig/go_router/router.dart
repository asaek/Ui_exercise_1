import 'package:aplicacion_1/presentation/pages/pages.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: StarNowPage.routerName,
      path: '/',
      builder: (context, state) => const StarNowPage(),
    ),
    GoRoute(
      name: PerfilGroupPage.routerName,
      path: '/perfilGroupPage',
      builder: (context, state) => const PerfilGroupPage(),
    ),
  ],
);
