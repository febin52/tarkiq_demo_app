class GetOtpEvent {}

class Verify extends GetOtpEvent {
  final String number;
  final String password;

  Verify({
    required this.number,
    required this.password,
  });
}
