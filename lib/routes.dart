import 'package:get/get.dart';
import 'package:test_app/core/constant/routes.dart';
import 'package:test_app/core/middleware/mymiddleware.dart';
import 'package:test_app/view/screen/auth/forgetpassword.dart';
import 'package:test_app/view/screen/auth/login.dart';
import 'package:test_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:test_app/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:test_app/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:test_app/view/screen/categories/add.dart';
import 'package:test_app/view/screen/categories/edit.dart';
import 'package:test_app/view/screen/categories/view.dart';
import 'package:test_app/view/screen/home.dart';
import 'package:test_app/view/screen/items/add.dart';
import 'package:test_app/view/screen/items/edit.dart';
import 'package:test_app/view/screen/items/view.dart';
import 'package:test_app/view/screen/language.dart';
import 'package:test_app/view/screen/orders/details.dart';
import 'package:test_app/view/screen/orders/screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),

  // GetPage(name: "/", page: () => const ProductDetails()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  // ========categories

  GetPage(name: AppRoute.categoriesview, page: () => const CategoriesView()),
  GetPage(name: AppRoute.categoriesadd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoute.categoriesedite, page: () => const CategoriesEdit()),
  // ===========Items

  GetPage(name: AppRoute.itemsview, page: () => const ItemsView()),
  GetPage(name: AppRoute.itemsadd, page: () => const ItemsAdd()),
  GetPage(name: AppRoute.itemsedit, page: () => const ItemsEdit()),

  // ===========Orders

  GetPage(name: AppRoute.ordershome, page: () => const OrdersScreen()),
];
