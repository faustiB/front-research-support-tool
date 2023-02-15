import 'package:research_support_tool/app/modules/home/home_binding.dart';
import 'package:research_support_tool/app/modules/home/home_view.dart';
import 'package:research_support_tool/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}