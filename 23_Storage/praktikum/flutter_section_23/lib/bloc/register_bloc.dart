import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_section_23/models/account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  late SharedPref sharedPref;

  RegisterBloc() : super(RegisterInitial()) {
    sharedPref = SharedPref();
    // on<RegisterEvent>((event, emit) {});
  }

  void getAccount() async {
    var account = await sharedPref.getAccount();
    var isLogin = await sharedPref.isLogin();
    emit(RegisterSuccess(
      account: account,
      isLogin: isLogin,
    ));
  }

  Future<bool> deleteAccount() async {
    var status = await sharedPref.deleteAccount();
    getAccount();
    return status;
  }

  Future<bool> createAccount(AccountModel account) async {
    var status = await sharedPref.saveAccount(account);
    getAccount();
    return status;
  }
}
