import 'package:flutter/material.dart';import 'package:flutter_basics/core/app_cubit/app_cubit.dart';import 'package:flutter_basics/core/di/injector.dart';import 'package:flutter_basics/core/routes/app_router.dart';import 'package:flutter_basics/core/theme/app_theme.dart';import 'package:flutter_bloc/flutter_bloc.dart';/// [MyApp] is entry of APPclass MyApp extends StatelessWidget {  /// Default constructor  const MyApp({super.key});  @override  Widget build(BuildContext context) {    return BlocProvider.value(      value: Injector.instance<AppCubit>(),      child: MaterialApp.router(        title: 'Flutter basics & Learning',        routerConfig: appRouter,        debugShowCheckedModeBanner: false,        theme: theme,      ),    );  }}