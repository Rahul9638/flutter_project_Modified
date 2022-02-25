import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rapido_screen/data/models/login_model.dart';
import 'package:rapido_screen/data/repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Repository repository;
  LoginCubit({required this.repository}) : super(LoginInitial());

  void loginRequest(String countryCode, String phone) {
    
    // LoginProcessing();
    repository.loginRequest(countryCode, phone).then((loginResponse){
      
      emit(LoginSuccess(loginResponse: loginResponse));
    });
  }
}
