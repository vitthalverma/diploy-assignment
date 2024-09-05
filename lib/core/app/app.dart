import 'package:diploy_assignment/core/app/app_colors.dart';
import 'package:diploy_assignment/core/app/app_router.dart';
import 'package:diploy_assignment/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:diploy_assignment/features/product/presentation/bloc/product_bloc.dart';
import 'package:diploy_assignment/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => sl<ProductBloc>()),
            BlocProvider(create: (context) => sl<CartBloc>()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: AppColors.green400,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: AppColors.whiteColor,
              ),
              scaffoldBackgroundColor: AppColors.whiteColor,
            ),
            onGenerateRoute: AppRouter.generateRoute,
          ),
        );
      },
    );
  }
}
