import 'package:go_router/go_router.dart';
import 'package:shared_car/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/main', routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/auth',
      name: AuthScreen.name,
      builder: (context, state) => const AuthScreen()),
  GoRoute(
      path: '/main',
      name: MainScreen.name,
      builder: (context, state) => const MainScreen()),
]);