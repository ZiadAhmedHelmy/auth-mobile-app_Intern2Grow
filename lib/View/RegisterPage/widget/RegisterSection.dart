import 'package:auth_task/View/LoginPage/LoginPage.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Models/Components/CustomBtn.dart';
import '../../../Models/Components/CustomText.dart';
import '../../../Models/Components/CustomTextFeild.dart';
import '../../../Utils/AppColors.dart';
import '../../../ViewModel/Bloc/Auth/auth_cubit.dart';
import '../../../ViewModel/Bloc/click_cubit.dart';

class RegisterSection extends StatelessWidget {
  const RegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    var auth = AuthCubit.get(context);
    var click = ClickCubit.get(context);
    return Form(
      key: auth.registerKey,
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
                    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter your Name';
    }
    if (value.length < 8) {
    return 'your name must have at least 8 characters';
    }
    return null;

                    },
                    controller: auth.usernameReg,
                    suffixIcon: IconButton(
                      onPressed: () {
                        auth.usernameReg.clear();
                      },
                      icon: Icon(
                        FluentIcons.delete_off_20_regular,
                        color: AppColor.grey,
                      ),
                    )),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Email Section
                CustomText(
                  text: "Email",
                  color: AppColor.grey,
                ),
                CustomTextField(
                    hintText: "",
                    controller: auth.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      String emailPattern =
                          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                      RegExp regex = RegExp(emailPattern);
                      if (!regex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        auth.email.clear();
                      },
                      icon: Icon(
                        FluentIcons.delete_off_20_regular,
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
                        obscureText: click.isShowenPassRegister,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 8) {
                            return 'Password must have at least 8 characters';
                          }
                          return null;
                        },
                        controller: auth.passwordReg,
                        suffixIcon: IconButton(
                          onPressed: () {
                            click.showPassWord();
                          },
                          icon: Icon(
                            click.isShowenPassRegister
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: false,
                        side: BorderSide(width: 2, color: AppColor.grey),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        onChanged: (value) {}),
                    const CustomText(
                      text: "Remmber me",
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const CustomText(
                    text: "Have a problem?",
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blueAccent,
                    decorationThickness: 4),
              ],
            ),

            CustomButton(
                text: "Register",
                color: AppColor.blue,
                textColor: AppColor.white,
                onTap: () {
                  if(auth.registerKey.currentState!.validate()){
                    print("Good Luck in Your Life");
                  }
                }),
            Row(
              children: [
                const CustomText(text: "Already have an account?  "),
                InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    child: const CustomText(
                        text: "Log in",
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
