import 'package:auth_task/ViewModel/data/Local/SharedKeys.dart';
import 'package:auth_task/ViewModel/data/Local/SharedPreferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Models/UserModel.dart';
import '../../data/network/DioHelper.dart';
import '../../data/network/endPoints.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);


  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();


  TextEditingController usernameReg = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passwordReg = TextEditingController();
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();


  UserModel? userInfo ;


  bool? rememberMeOrNot = false;

  Future<void> login() async {
    emit(LoginLoadingState());
    await DioHelper.post(endPoint: EndPoints.Login, body: {
      "username": username.text,
      "password": password.text,
    }).then((value) {
      print(value?.data);
      userInfo = UserModel.fromJson(value?.data);
      storeLocalData();
      emit(LoginSuccessState());
    }).catchError((error) {
      if (error is DioException) {
        print(error.response?.data);
      }
      emit(LoginErrorState());
      throw error;
    });
  }
  
  void rememberMyAccount(){
    rememberMeOrNot = !rememberMeOrNot!;
    emit(RememberMeStateChanged());
  }
  
  void wantRememberMe(){
     if(rememberMeOrNot == true){
       if(userInfo?.token!=null) {
         LocalData.setData(key: SharedKey.token, value: userInfo?.token);
         print("Token Saved");
         emit(RememberMeState());
       }else{
         print('Enter Your Info');
       }
     }

  }

  void storeLocalData() {
    print("Using StoreDataFirebase");
    // LocalData.setData(key: SharedKey.isLogin, value: userInfo?.token);
    LocalData.setData(key: SharedKey.email, value: userInfo?.email);
    print(userInfo?.email);
    LocalData.setData(key: SharedKey.userName, value: userInfo?.username);
    print(userInfo?.username);
    LocalData.setData(key: SharedKey.image, value: userInfo?.image);
    print(userInfo?.image);
    LocalData.setData(key: SharedKey.gender, value: userInfo?.gender);
    print(userInfo?.gender);
  }




  clearData(){
    password.clear();
    username.clear();
  }



}
