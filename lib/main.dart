import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_ecommerce/blocObserver.dart';
import 'package:route_ecommerce/core/routes_manager/route_generator.dart';
import 'package:route_ecommerce/core/routes_manager/routes.dart';
import 'package:route_ecommerce/data/sharedPreferences/sharedPreference.dart';
import 'package:route_ecommerce/domain/di/di.dart';
import 'package:route_ecommerce/features/authpresentationscreen/login/cubit/login_view_model.dart';
import 'package:route_ecommerce/features/authpresentationscreen/register/cubit/register_view_model.dart';

// flutter packages pub run build_runner watch

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferenceUtils.init();
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt.get<RegisterViewModel>(),
        ),
        BlocProvider(
          create: (_) => getIt.get<LoginViewModel>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-Commerce',
          home: child,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: SharedPreferenceUtils.get("token") != null ? Routes.homeScreenRoutes : Routes.splashScreen,
        );
      },
    );
  }
}
