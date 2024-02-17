import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'click_state.dart';

class ClickCubit extends Cubit<ClickState> {
  ClickCubit() : super(ClickInitial());
  static ClickCubit get(context) => BlocProvider.of(context);






  bool isShowenPassLogin = true;
  bool isShowenPassRegister = true;




  void showPassWord(){
    isShowenPassLogin=!isShowenPassLogin;
    emit(ShowPassWordOrNot());
  }

  void showPassWordRegister(){
    isShowenPassRegister=!isShowenPassRegister;
    emit(ShowPassWordOrNot());
  }



}
