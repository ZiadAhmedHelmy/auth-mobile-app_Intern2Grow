
import 'package:auth_task/View/LoginPage/widget/LoginSection.dart';

import 'package:flutter/material.dart';

import '../../Models/widget/Appbar.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:PreferredSize(
        preferredSize: MediaQuery.of(context).size / 3,
        child: const Appbar(title:"Log in to your account" ,imageIcon: "Assets/Images/gradient_background.png", ),
      ),
      body: ListView(
        children: const [
            LoginSection()

        ],
      ),
    );
  }
}
