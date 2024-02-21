import 'package:eGrocer/user_app/utils/global_context_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes/routes.dart';
import 'domain/blocs/themes/themes_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesBloc, ThemesBlocState>(
        builder: (BuildContext context, state) {
      return MaterialApp(
        navigatorKey: GlobalContext.globalNavigatorContext,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: state.themesModel.currentState == ThemesState.light
            ? state.themesModel.lightTheme
            : state.themesModel.darkTheme,
        routes: Routes.pathRoutes(),
        initialRoute: NavigationRouteNames.loaderWidget,
      );
    });
  }
}
