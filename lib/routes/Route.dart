import "package:flutterinterviewproject/bindings/login_binding.dart";
import "package:flutterinterviewproject/bindings/product_detail_binding.dart";
import "package:flutterinterviewproject/bindings/product_list_binding.dart";
import "package:flutterinterviewproject/bindings/register_binding.dart";
import "package:flutterinterviewproject/screens/login_screen.dart";
import "package:flutterinterviewproject/screens/product_detail_screen.dart";
import "package:flutterinterviewproject/screens/products_screen.dart";
import "package:flutterinterviewproject/screens/register_screen.dart";
import "package:flutterinterviewproject/screens/static_product_details_screen.dart";
import "package:flutterinterviewproject/screens/static_product_list.dart";
import "package:flutterinterviewproject/services/storage_service.dart";
import "package:get/get.dart";

class RouteName {
  static const String initial = "/";
  static const String registerScreen = "/registerScreen";
  static const String productsScreen = "/ProductsScreen";
  static const String productDetailScreen = "/productDetailScreen";
  static const String staticProductListScreen = "/staticProductListScreen";
  static const String staticProductDetailsScreen =
      "/staticProductDetailsScreen";
}

List<String> get validRoutes {
  return <String>[
    RouteName.initial,
    RouteName.registerScreen,
    RouteName.productsScreen,
    RouteName.productDetailScreen,
    RouteName.staticProductListScreen,
    RouteName.staticProductDetailsScreen,
  ];
}

class Routes {
  static final List<GetPage> routes = <GetPage>[
    GetPage(
      page: () => const LoginScreen(),
      name: RouteName.initial,
      binding: LoginBinding(),
    ),
    GetPage(
      page: () => const RegisterScreen(),
      name: RouteName.registerScreen,
      binding: RegisterBinding(),
    ),
    GetPage(
      page: ProductsScreen.new,
      name: RouteName.productsScreen,
      binding: ProductListBinding(),
    ),
    GetPage(
      page: () => const ProductDetailScreen(),
      name: RouteName.productDetailScreen,
      binding: ProductDetailBinding(),
    ),
    GetPage(
      page: () => const StaticProductListScreen(),
      name: RouteName.staticProductListScreen,
    ),
    GetPage(
      page: StaticProductDetailsScreen.new,
      name: RouteName.staticProductDetailsScreen,
    ),
  ];

  String get initialRoute {
    final userData = StorageServices().getData();
    if (userData.isNotEmpty) {
      return RouteName.productsScreen;
    } else {
      return RouteName.initial;
    }
  }
}
