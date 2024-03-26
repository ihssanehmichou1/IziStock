
class TPlatformException implements Exception{

  final String message;

  const TPlatformException([this.message = 'An unexpected format error occurred . Please check your input.']);

  factory TPlatformException.fromMessage(String message){
    return TPlatformException(message);
  }

  String get formattedMessage => message;

  ///create a format exception from a specific error code.
  factory TPlatformException.fromCode(String code){
    switch (code){
      case 'invalid-email-format':
        return const TPlatformException('The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const TPlatformException('The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const TPlatformException('The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const TPlatformException('The URL format is invalid. Please enter a valid URL.');
      default:
        return const TPlatformException('Unknown error occurred.');
    }
  }
}