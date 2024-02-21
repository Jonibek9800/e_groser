import 'package:eGrocer/admin_app/admin_widget/category_options_widgets/create_category_widget/add_category_widget.dart';
import 'package:eGrocer/admin_app/admin_widget/category_options_widgets/update_category_widget/update_category_widget.dart';
import 'package:eGrocer/admin_app/admin_widget/order_options_widget/orders_edit_list_widget/orders_list_widget.dart';
import 'package:eGrocer/admin_app/admin_widget/order_options_widget/update_order_status/update_order_status.dart';
import 'package:eGrocer/admin_app/admin_widget/product_options_widgets/create_product_widget/add_product_widget.dart';
import 'package:eGrocer/admin_app/admin_widget/product_options_widgets/products_edit_list_widget/product_edit_list_widget.dart';
import 'package:eGrocer/admin_app/admin_widget/product_options_widgets/update_product_widget/update_product_widget.dart';
import 'package:eGrocer/admin_app/admin_widget/slider_options_widgets/add_poster_widget/add_poster_widget.dart';
import 'package:eGrocer/admin_app/admin_widget/slider_options_widgets/posters_edit_list_widget/poster_edit_list_widget.dart';
import 'package:eGrocer/admin_app/admin_widget/slider_options_widgets/update_poster_widget/update_poster_widget.dart';
import 'package:flutter/material.dart';

import '../admin_app/admin_widget/category_options_widgets/categories_edit_list_widget/categories_edit_list_widget.dart';
import '../admin_app/admin_widget/user_options_widgets/create_user_wdget/create_user_widget.dart';
import '../admin_app/admin_widget/user_options_widgets/update_user_widget/update_user_widget.dart';
import '../admin_app/admin_widget/user_options_widgets/users_edit_list_widget/users_edit_list_widget.dart';
import '../admin_app/main_page/admin_main_page.dart';
import '../user_app/widget/auth/auth_widget.dart';
import '../user_app/widget/cart_page/cart_page_widget.dart';
import '../user_app/widget/checkout_page/checkout_widget.dart';
import '../user_app/widget/loader_page/loader_widget.dart';
import '../user_app/widget/location_page/confirm_location_widget.dart';
import '../user_app/widget/location_page/location_page_widget.dart';
import '../user_app/widget/main_page/main_page_widget.dart';
import '../user_app/widget/orders_page/order_details_widget.dart';
import '../user_app/widget/orders_page/order_page_widget.dart';
import '../user_app/widget/product_card/product_card_widget.dart';
import '../user_app/widget/products_page/products_by_category_widget.dart';
import '../user_app/widget/products_page/products_widget.dart';
import '../user_app/widget/profile_page/edit_profile_widget.dart';
import '../user_app/widget/profile_page/profile_page_widget.dart';
import '../user_app/widget/search_widget/search_widget.dart';

abstract class NavigationRouteNames {
  ///Admin Routes
  static const userEditPage = "$adminMainPage/user/edit";
  static const addUserPage = "$userEditPage/add/user";
  static const updateUserPage = "$userEditPage/update";

  static const productEditList = "$adminMainPage/products";
  static const productUpdatePage = "$productEditList/update";
  static const productAddPage = "$productEditList/add";

  static const posterEditPage = "$adminMainPage/poster/edit";
  static const posterAddPage = "$posterEditPage/poster/add";
  static const posterUpdatePage = "$posterEditPage/poster/update";

  static const categoryEditPage = "$adminMainPage/category/list";
  static const addCategoryPage = "$categoryEditPage/add";
  static const updateCategoryPage = "$categoryEditPage/update";

  static const ordersPage = "$adminMainPage/order";
  static const pageUpdateOrder = "$ordersPage/update";

  static const adminMainPage = "/admin_main_page";

  ///User Routs
  static const loaderWidget = "/";
  static const auth = "/auth";
  static const mainPage = "/main_page";
  static const products = "$mainPage/products";
  static const cartPage = "/cart_page";
  static const checkout = "$cartPage/checkout";
  static const searchPage = "/search_page";
  static const profile = "/profile";
  static const editProfile = "$profile/edit_profile";
  static const allOrders = "$profile/orders";
  static const orderDetails = "$allOrders/details";
  static const location = "/location";
  static const confirmLocation = '$location/confirm';
  static const productCard = '/product/product_card';

  static const productByCategory = "/categories/product_by_category";
}

class Routes {
  static Map<String, WidgetBuilder> pathRoutes() {
    return {
      /// Admin Routes
      NavigationRouteNames.userEditPage: (_) => const UserEditWidget(),
      NavigationRouteNames.addUserPage: (_) => const CreateUserWidget(),
      NavigationRouteNames.updateUserPage: (_) => const UpdateUserWidget(),
      NavigationRouteNames.categoryEditPage: (_) => const CategoriesEditListWidget(),
      NavigationRouteNames.addCategoryPage: (_) => const AddCategoryWidget(),
      NavigationRouteNames.updateCategoryPage: (_) => const UpdateCategoryWidget(),
      NavigationRouteNames.productEditList: (_) => const ProductEditListWidget(),
      NavigationRouteNames.productUpdatePage: (_) => const UpdateProductWidget(),
      NavigationRouteNames.productAddPage: (_) => const AddProductWidget(),
      NavigationRouteNames.posterEditPage: (_) => const PosterEditListWidget(),
      NavigationRouteNames.posterAddPage: (_) => const AddPosterWidget(),
      NavigationRouteNames.posterUpdatePage: (_) => const UpdatePosterWidget(),
      NavigationRouteNames.ordersPage: (_) => const OrdersListWidget(),
      NavigationRouteNames.pageUpdateOrder: (_) => const UpdateOrderWidget(),

      /// User Routes
      NavigationRouteNames.loaderWidget: (_) => const LoaderWidget(),
      NavigationRouteNames.auth: (_) => const AuthWidget(),
      NavigationRouteNames.mainPage: (_) => const MainPageWidget(),
      NavigationRouteNames.products: (_) => const ProductsWidget(),
      NavigationRouteNames.cartPage: (_) => const CartPageWidget(),
      NavigationRouteNames.searchPage: (_) => const SearchWidget(),
      NavigationRouteNames.productByCategory: (_) => const ProductsByCategoryWidget(),
      NavigationRouteNames.profile: (_) => const ProfilePageWidget(),
      NavigationRouteNames.editProfile: (_) => const EditProfileWidget(),
      NavigationRouteNames.checkout: (_) => const CheckoutWidget(),
      NavigationRouteNames.allOrders: (_) => const OrdersWidget(),
      NavigationRouteNames.orderDetails: (_) => const OrderDetailsWidget(),
      NavigationRouteNames.location: (_) => const LocationWidget(),
      NavigationRouteNames.confirmLocation: (_) => const ConfirmLocationWidget(),
      NavigationRouteNames.productCard: (_) => const ProductCardWidget(),
      NavigationRouteNames.adminMainPage: (_) => const AdminMainPageWidget(),
    };
  }

  static void resetNavigation(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(NavigationRouteNames.loaderWidget, (route) => false);
  }
}
