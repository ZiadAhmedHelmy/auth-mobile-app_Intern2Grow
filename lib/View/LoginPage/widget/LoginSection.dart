import 'package:auth_task/View/RegisterPage/RegisterPage.dart';
import 'package:auth_task/View/HomePage/homePage.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Models/Components/CustomBtn.dart';
import '../../../Models/Components/CustomText.dart';
import '../../../Models/Components/CustomTextFeild.dart';
import '../../../Utils/AppColors.dart';
import '../../../ViewModel/Bloc/Auth/auth_cubit.dart';
import '../../../ViewModel/Bloc/click_cubit.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    var auth = AuthCubit.get(context);
    var click = ClickCubit.get(context);
    return Form(
      key: auth.loginKey,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //UserName Section
                CustomText(
                  text: "Username",
                  color: AppColor.grey,
                ),
                CustomTextField(
                    hintText: "",
                    controller: auth.username,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Name';
                      }
                      if (value.length < 8) {
                        return 'your name must have at least 8 characters';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        auth.username.clear();
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: AppColor.grey,
                      ),
                    )),
              ],
            ),
            BlocConsumer<ClickCubit, ClickState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Password",
                      color: AppColor.grey,
                    ),
                    CustomTextField(
                        hintText: "",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 5) {
                            return 'Password must have at least 8 characters';
                          }
                          return null;
                        },
                        obscureText: click.isShowenPassLogin,
                        controller: auth.password,
                        suffixIcon: IconButton(
                          onPressed: () {
                            click.showPassWord();
                          },
                          icon: Icon(
                            click.isShowenPassLogin
                                ? FluentIcons.eye_off_16_regular
                                : FluentIcons.eye_16_regular,
                            color: AppColor.grey,
                          ),
                        )),
                  ],
                );
              },
            ),

            // Remember Me Section
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: auth.rememberMeOrNot,
                            side: BorderSide(width: 2, color: AppColor.grey),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            onChanged: (value) {
                              auth.rememberMyAccount();
                              print(auth.rememberMeOrNot);
                            }),
                        const CustomText(
                          text: "Remember me",
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    const CustomText(
                        text: "Forgot password?",
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blueAccent,
                        decorationThickness: 4),
                  ],
                );
              },
            ),

            CustomButton(
                text: "Log in",
                color: AppColor.blue,
                textColor: AppColor.white,
                onTap: () {
                  if (AuthCubit.get(context)
                      .loginKey
                      .currentState!
                      .validate()) {
                    auth.login().then((value) {
                      auth.wantRememberMe();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                      auth.clearData();
                    });
                  }
                }),

            Row(
              children: [
                const CustomText(text: "Don’t have an account?  "),
                InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ));
                    },
                    child: const CustomText(
                        text: "Register",
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blueAccent,
                        decorationThickness: 4))
              ],
            )
          ],
        ),
      ),
    );
  }
}
