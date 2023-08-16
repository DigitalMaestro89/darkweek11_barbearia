sealed class AuthExecption implements Exception {
  final String message;

  AuthExecption({
    required this.message
  });
}

class AuthError extends AuthExecption {
  AuthError({required super.message});
}

class AuthUnauthorizedException extends AuthExecption {
  AuthUnauthorizedException() : super(message: '');
}