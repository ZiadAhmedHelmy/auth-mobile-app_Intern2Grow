import 'package:auth_task/ViewModel/Bloc/Auth/auth_cubit.dart';
import 'package:auth_task/ViewModel/data/Local/SharedKeys.dart';
import 'package:auth_task/ViewModel/data/Local/SharedPreferences.dart';
import 'package:flutter/material.dart';

import '../Components/CustomText.dart';
class Appbar extends StatelessWidget {
  final String title;
  final String imageIcon;
  const Appbar({super.key, required this.title, required this.imageIcon});

  @override
  Widget build(BuildContext context) {
    var auth = AuthCubit.get(context);
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
                flex: 2,
                child: Image.asset(
                  "Assets/Images/gradient_background.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                )),
            const Expanded(

                child: SizedBox()
            )
          ],
        ),

        // LOGO !!!
        Align(
          alignment: Alignment.bottomCenter,
          heightFactor: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(60), // Image radius
                    child:LocalData.getData(key: SharedKey.image) !=null ? Image.network(imageIcon ?? "") : Image.asset("Assets/Images/intern2grow.png"),
                  ),
                ),
              ),
               const SizedBox(
                 height: 15,
               ),
               CustomText(
                text: title,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
