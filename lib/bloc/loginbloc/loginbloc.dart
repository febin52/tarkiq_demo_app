import 'dart:async';

import 'package:example_app/bloc/loginbloc/loginevents.dart';
import 'package:example_app/bloc/loginbloc/loginstates.dart';

import 'package:example_app/data/models/login_model.dart';

import 'package:example_app/data/repositories.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginBloc extends Bloc<GetOtpEvent, LoginStates> {
  LoginBloc() : super(LoginInitial()) {
    on<Verify>(verify);
  }

  Future<FutureOr<void>> verify(Verify event, Emitter<LoginStates> emit) async {
    emit(StartLoading());

    LoginModel loginModel;

    Map<String, String> data = {
      "email": event.number,
      "password": event.password,
    };

    loginModel = await Repository().login(
        url: 'http://restapi.adequateshop.com/api/authaccount/login',
        data: data);
    if (loginModel.code == 0) {
      Fluttertoast.showToast(msg: loginModel.message!);

      emit(LoginSuccess());
    } else {
      if (loginModel.message != null) {
        Fluttertoast.showToast(msg: loginModel.message!);
        emit(LoginError(error: loginModel.message!));
      } else {
        Fluttertoast.showToast(msg: "Login Failed");
        emit(LoginError(error: "Login Failed"));
      }
    }
  }
}
