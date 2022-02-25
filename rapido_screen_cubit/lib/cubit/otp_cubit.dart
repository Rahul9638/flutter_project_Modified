import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rapido_screen/cubit/login_cubit.dart';
import 'package:rapido_screen/data/repository.dart';

import '../data/models/otp_model.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final Repository repository;
  final LoginCubit loginCubit;

  OtpCubit({required this.repository, required this.loginCubit})
      : super(OtpInitial());

  Future isAuthorized(String pin, String token) async{
    repository.isAuthorized(pin, token).then((otpResponse) {
      emit(OtpSucess(otpResponse:otpResponse));
    });
  }
}
