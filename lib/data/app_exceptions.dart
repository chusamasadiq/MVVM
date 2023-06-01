class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix $_message';
  }
}

// Time out Error
class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, 'Error during communication');
}

// For example URL does not exist, but you are hitting.
class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, 'Invalid URL');
}

// For example, When try to login, receive a token to validate,every user has his own token.
// If its your token then you can get access to your data like Facebook profile.
class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message]) : super(message, 'Unauthorized access');
}

// User enters invalid output.
class InputException extends AppExceptions {
  InputException([String? message]) : super(message, 'Invalid access');
}

