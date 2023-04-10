part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => List.empty();
}

class SharedPref {
  final String _name = 'name';
  final String _email = 'email';
  final String _password = 'password';
  final String _phone = 'phone';

  Future<bool> saveAccount(AccountModel account) async {
    final store = await SharedPreferences.getInstance();
    final name = await store.setString(_name, account.name);
    final email = await store.setString(_email, account.email);
    final password = await store.setString(_password, account.password);
    final phone = await store.setString(_phone, account.phone);
    if (name && email && password && phone) return true;

    return false;
  }

  Future<AccountModel?> getAccount() async {
    final store = await SharedPreferences.getInstance();
    final name = store.getString(_name);
    final email = store.getString(_email);
    final password = store.getString(_password);
    final phone = store.getString(_phone);

    if (name != null && email != null && password != null && phone != null) {
      return AccountModel(name, email, password, phone);
    }
    return null;
  }

  Future<bool> deleteAccount() async {
    final store = await SharedPreferences.getInstance();
    final name = await store.remove(_name);
    final email = await store.remove(_email);
    final password = await store.remove(_password);
    final phone = await store.remove(_phone);
    if (name && email && password && phone) return true;
    return false;
  }

  Future<bool> isLogin() async {
    var currentUser = await getAccount();
    if (currentUser != null) return true;
    return false;
  }
}
