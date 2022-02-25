part of 'otp_cubit.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}
class OtpSucess extends OtpState{
  final OtpResponse otpResponse;

  OtpSucess({required this. otpResponse});


}