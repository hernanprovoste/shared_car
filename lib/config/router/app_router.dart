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
  GoRoute(
      path: '/sign_in',
      name: SignInScreen.name,
      builder: (context, state) => const SignInScreen()),
  GoRoute(
      path: '/sign_up',
      name: SignUpScreen.name,
      builder: (context, state) => const SignUpScreen()),
  GoRoute(
      path: '/user_main_page',
      name: UserMainPageScreen.name,
      builder: (context, state) => const UserMainPageScreen()),
  GoRoute(
      path: '/find_cars',
      name: FindCarsScreen.name,
      builder: (context, state) => const FindCarsScreen()),
  GoRoute(
      path: '/map',
      name: ClienteMapScreen.name,
      builder: (context, state) => const ClienteMapScreen()),
  GoRoute(
      path: '/driverScreen',
      name: DriverScreen.name,
      builder: (context, state) => const DriverScreen()),
]);