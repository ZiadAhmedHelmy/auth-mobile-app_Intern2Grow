import 'package:auth_task/View/LoginPage/LoginPage.dart';
import 'package:auth_task/ViewModel/Bloc/Auth/auth_cubit.dart';
import 'package:auth_task/ViewModel/data/Local/SharedKeys.dart';
import 'package:auth_task/ViewModel/data/Local/SharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Models/Components/CustomBtn.dart';
import '../../../Models/Components/CustomText.dart';
import '../../../Models/Components/CustomTextFeild.dart';
import '../../../Utils/AppColors.dart';
class  InfoSection extends StatelessWidget {
  const  InfoSection({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController(text:LocalData.getData(key: SharedKey.userName) );
    TextEditingController email = TextEditingController(text:LocalData.getData(key: SharedKey.email) );
    TextEditingController gender = TextEditingController(text:LocalData.getData(key: SharedKey.gender) );
    return   Form(
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
                    controller: username,
                    readOnly: true,
                    ),
              ],
            ),
            const SizedBox(height: 15,),
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Email",
                      color: AppColor.grey,
                    ),
                    CustomTextField(
                        hintText: "",
                        readOnly: true,
                        controller:email,
                       ),
                  ],
                ),
            const SizedBox(height: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Gender",
                  color: AppColor.grey,
                ),
                CustomTextField(
                  hintText: "",
                  readOnly: true,
                  controller:gender,
                ),
              ],
            ),
            const SizedBox(height: 15,),
            CustomButton(text: "Log out", color: AppColor.red,textColor: AppColor.white , onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
              LocalData.clearData();
            }),
          ],
        ),
      ),
    );
  }
}
