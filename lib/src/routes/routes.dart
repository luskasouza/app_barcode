import 'package:get/get.dart';
import '../screens/home_screen.dart';

class RouteController {
  static String home = '/home';

  static String getHomeRoute() => home;
  static List<GetPage> routes = [
    GetPage(
      page: () => HomeScreen(),
      name: home,
    ),
  ];
}
