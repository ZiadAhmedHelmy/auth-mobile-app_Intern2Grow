import 'package:auth_task/View/LoginPage/LoginPage.dart';
import 'package:auth_task/View/HomePage/homePage.dart';
import 'package:auth_task/ViewModel/Bloc/Auth/auth_cubit.dart';
import 'package:auth_task/ViewModel/Bloc/click_cubit.dart';
import 'package:auth_task/ViewModel/data/Local/SharedKeys.dart';
import 'package:auth_task/ViewModel/data/Local/SharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ViewModel/data/network/DioHelper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  LocalData.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ClickCubit(),),
        BlocProvider(create: (context) => AuthCubit(),),
      ],
      child:MaterialApp(
        home: LocalData.getData(key: SharedKey.token)!=null ? const HomePage() : LoginPage(),
      ),
    );
  }
}
