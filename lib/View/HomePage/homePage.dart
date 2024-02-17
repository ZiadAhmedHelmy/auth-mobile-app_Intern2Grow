import 'package:auth_task/View/HomePage/widget/HomeSection.dart';
import 'package:auth_task/ViewModel/Bloc/Auth/auth_cubit.dart';
import 'package:auth_task/ViewModel/data/Local/SharedKeys.dart';
import 'package:auth_task/ViewModel/data/Local/SharedPreferences.dart';
import 'package:flutter/material.dart';

import '../../Models/widget/Appbar.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var auth = AuthCubit.get(context);
    print("${LocalData.getData(key: SharedKey.userName)}");
    return  Scaffold(
      appBar:PreferredSize(
        preferredSize: MediaQuery.of(context).size / 3,
        child:  Appbar(title:"${LocalData.getData(key: SharedKey.userName)}" ,imageIcon: "${LocalData.getData(key: SharedKey.image)}", ),

      ),
      body: InfoSection(),
    );
  }
}
