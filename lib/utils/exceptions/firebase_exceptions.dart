 class TFirebaseException implements Exception{

  final String code;
  final String message;

  const TFirebaseException(this.code, [this.message = 'An unexpected format error occurred . Please check your input.']);

  factory TFirebaseException.fromMessage(String message){
    return TFirebaseException(message);
  }

  String getMessage(String code) {
    switch (code) {
      case "unknown":
        return "An unknown Firebase error occurred. Please try again.";
      case "invalid custom token":
        return "The custom token format is incorrect. Please check your custom token.";
      case "custom token mismatch":
        return "The custom token corresponds to a different audience.";
      case "user-disabled":
        return "The user account has been disabled.";
      case "user-not-found":
        return "No user found for the given email or UID.";
      case "invalid-email":
        return "The email address provided is invalid. Please enter a valid email.";
      case "email-already-in-use":
        return "The email address is already registered. Please use a different email.";
      case "wrong-password":
        return "Incorrect password. Please check your password and try again.";
      case "weak-password":
        return "The password is too weak. Please choose a stronger password.";
      case "provider-already-linked":
        return "The account is already linked with another provider.";
      case "operation-not-allowed":
        return "This operation is not allowed. Contact support for assistance.";
      case "invalid-credential":
        return "The supplied credential is malformed or has expired.";
      case "invalid-verification-code":
        return "Invalid verification code. Please enter a valid code.";
      case 'missing-app-credential':
        return 'The app credential is missing. Please provide a valid one.';
      case 'session-cookie-expired':
        return 'The Firebase session cookie has expired. Please refresh.';
      case 'user-id-already-exists':
        return 'The provided user ID is already in use by another user.';
      case 'sen-storage-unsupported':
        return 'Web storage is not supported or is disabled.';
      case 'app-deleted':
        return 'This instance of FirebaseApp has been deleted.';
      case 'user-token-mismatch':
        return 'The provided user\'s token does not match the authenticated user\'s token.';
      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid.';
      case 'invalid-sender':
        return 'The email template sender is invalid. Please verify the sender\'s email.';
      case 'invalid-recipient-email':
        return 'The recipient email address is invalid. Please provide a valid recipient email.';
      case 'missing-action-code':
        return 'The action code is missing. Please provide a valid action code.';
      case 'user-token-expired':
        return 'The user\'s token has expired, and authentication is required. Please sign in again.';
      case 'invalid-login-credentials':
        return 'Invalid login credentials.';
      case 'expired-action-code':
        return 'The action code has expired. Please request a new action code.';
      case 'invalid-action-code':
        return 'The action code is invalid. Please check the code and try again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      default:
        return 'An unexpected format error occurred . Please try again.';
    }
  }

 }