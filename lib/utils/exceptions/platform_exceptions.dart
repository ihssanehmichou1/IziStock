
class TPlatformException implements Exception{

  final String message;

  const TPlatformException([this.message = 'An unexpected format error occurred . Please check your input.']);

  factory TPlatformException.fromMessage(String message){
    return TPlatformException(message);
  }

  String get formattedMessage => message;

  ///create a format exception from a specific error code.
  String getMessage(String code) {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Please double-check your information.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'invalid-argument':
        return 'Invalid argument provided to the authentication method.';
      case 'invalid-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-phone-number':
        return 'The provided phone number is invalid.';
      case 'operation-not-allowed':
        return 'The sign-in provider is disabled for your Firebase project.';
      case 'session-cookie-expired':
        return 'The Firebase session cookie has expired. Please sign in again.';
      case 'user-id-already-exists':
        return 'The provided user ID is already in use by another user.';
      case 'sign-in-failed':
        return 'Sign-in failed. Please try again.';
      case 'network-request-failed':
        return 'Network request failed. Please check your internet connection.';
      case 'internal-error':
        return 'Internal error. Please try again later.';
      default:
        return ' a unspected plateform, Please try again.';
    }
  }

}