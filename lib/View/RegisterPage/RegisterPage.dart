import 'package:auth_task/View/RegisterPage/widget/RegisterSection.dart';
import 'package:flutter/material.dart';

import '../../Models/widget/Appbar.dart';
import '../LoginPage/widget/LoginSection.dart';
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: MediaQuery.of(context).size / 3,
        child: const Appbar(title:"Create new account" ,imageIcon: "Assets/Images/gradient_background.png", ),
      ),
      body: ListView(
        children:  const [
      RegisterSection()
        ],
      ),
    );
  }
}
