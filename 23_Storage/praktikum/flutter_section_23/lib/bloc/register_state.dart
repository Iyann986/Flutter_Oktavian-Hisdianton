part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => List.empty();
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final AccountModel? account;
  final bool? isLogin;
  final bool? statusAction;

  const RegisterSuccess({
    this.account,
    this.isLogin,
    this.statusAction,
  });

  @override
  List<Object?> get props => [account, isLogin, statusAction];
}
