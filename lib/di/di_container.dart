import 'package:eGrocer/main.dart';
import 'package:eGrocer/user_app/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:eGrocer/user_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../admin_app/admin_bloc/category_options_bloc/category_bloc.dart';
import '../admin_app/admin_bloc/product_options_bloc/product_bloc.dart';
import '../admin_app/admin_bloc/slider_options_bloc/slider_bloc.dart';
import '../admin_app/admin_bloc/user_options_bloc/user_bloc.dart';
import '../user_app/domain/blocs/cart_blocs/cart_bloc.dart';
import '../user_app/domain/blocs/categories_bloc/categories_bloc.dart';
import '../user_app/domain/blocs/favorite_cubit/favorite_cubit.dart';
import '../user_app/domain/blocs/list_state_cubit/product_list_cubit.dart';
import '../user_app/domain/blocs/list_state_cubit/search_list_cubit.dart';
import '../user_app/domain/blocs/location_cubit/location_cubit.dart';
import '../user_app/domain/blocs/products_bloc/products_bloc.dart';
import '../user_app/domain/blocs/slider_cubit/slider_cubit.dart';
import '../user_app/domain/blocs/sort_bloc/sort_bloc.dart';
import '../user_app/domain/blocs/themes/themes_bloc.dart';
import '../user_app/widget/auth/auth_cubit.dart';
import '../user_app/widget/loader_page/loader_view_cubit.dart';
import '../user_app/widget/main_page/main_page_bloc.dart';

final locator = GetIt.instance;

class AppFactoryDefault implements AppFactory {
  @override
  Widget makeApp() => const MyApp();
}

class MultiProviders {
  MultiBlocProvider providers() {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => AuthBloc()),
      BlocProvider(create: (_) => CategoriesBloc()),
      BlocProvider(create: (_) => MainBloc()),
      BlocProvider(create: (_) => ProductsBloc()),
      BlocProvider(create: (_) => CartBloc()),
      BlocProvider(create: (_) => LoaderViewCubit()),
      BlocProvider(create: (_) => AuthViewCubit()),
      BlocProvider(create: (_) => ThemesBloc()),
      BlocProvider(create: (_) => LocationCubit()),
      BlocProvider(create: (_) => FavoriteCubit()),
      BlocProvider(create: (_) => SortBloc()),
      BlocProvider(create: (_) => SearchListCubit()),
      BlocProvider(create: (_) => ProductListCubit()),
      BlocProvider(create: (_) => UserBloc()),
      BlocProvider(create: (_) => SliderCubit()),
      BlocProvider(create: (_) => CategoryBloc()),
      BlocProvider(create: (_) => ProductBloc()),
      BlocProvider(create: (_) => SliderBloc()),
    ], child: AppFactoryDefault().makeApp());
  }
}

void registerLocator() {
  locator.registerLazySingleton<AppFactoryDefault>(() => AppFactoryDefault());
  locator.registerLazySingleton<MultiProviders>(() => MultiProviders());
}

void state() {
  print("Hello");
}