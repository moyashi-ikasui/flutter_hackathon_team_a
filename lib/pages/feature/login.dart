import 'package:flutter_hackathon_team_a/pages/feature/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Login extends AutoDisposeNotifier<LoginState> {
  Login();

  void inputPhoneNumber(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  void inputPassword(String password) {
    state = state.copyWith(password: password);
  }

  @override
  LoginState build() {
    return const LoginState(
      phoneNumber: '',
      password: '',
    );
  }
}

final loginProvider =
    NotifierProvider.autoDispose<Login, LoginState>(Login.new);
