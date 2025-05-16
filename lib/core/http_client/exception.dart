class ServerException implements Exception {
  final String message;
  const ServerException([this.message = "A server error occurred"]);

  @override
  String toString() => message;
}

class AuthException implements Exception {
  final String message;
  const AuthException([this.message = "Authentication failed"]);

  @override
  String toString() => message;
}

class NoInternetException implements Exception {
  final String message;
  const NoInternetException([this.message = "No Internet Connection"]);

  @override
  String toString() => message;
}

class TimeOutException implements Exception {
  final String message;
  const TimeOutException([this.message = "Request Timeout"]);

  @override
  String toString() => message;
}

class ConflictException implements Exception {
  final String message;
  const ConflictException([this.message = "Conflict"]);

  @override
  String toString() => message;
}

class GoneException implements Exception {
  final String message;
  const GoneException([this.message = "Gone"]);

  @override
  String toString() => message;
}

class PreconditionFailedException implements Exception {
  final String message;
  const PreconditionFailedException([this.message = "Precondition Failed"]);

  @override
  String toString() => message;
}

class UnsupportedMediaTypeException implements Exception {
  final String message;
  const UnsupportedMediaTypeException(
      [this.message = "Unsupported Media Type"]);

  @override
  String toString() => message;
}

class TooManyRequestsException implements Exception {
  final String message;
  const TooManyRequestsException([this.message = "Too Many Requests"]);

  @override
  String toString() => message;
}

class InternalServerErrorException implements Exception {
  final String message;
  const InternalServerErrorException([this.message = "Internal Server Error"]);

  @override
  String toString() => message;
}

class BadGatewayException implements Exception {
  final String message;
  const BadGatewayException([this.message = "Bad Gateway"]);

  @override
  String toString() => message;
}

class ServiceUnavailableException implements Exception {
  final String message;
  const ServiceUnavailableException([this.message = "Service Unavailable"]);

  @override
  String toString() => message;
}

class GatewayTimeoutException implements Exception {
  final String message;
  const GatewayTimeoutException([this.message = "Gateway Timeout"]);

  @override
  String toString() => message;
}

class MethodNotAllowedException implements Exception {
  final String message;
  const MethodNotAllowedException([this.message = "Method Not Allowed"]);

  @override
  String toString() => message;
}

class NotAcceptableException implements Exception {
  final String message;
  const NotAcceptableException([this.message = "Not Acceptable"]);

  @override
  String toString() => message;
}

class ForbiddenException implements Exception {
  final String message;
  const ForbiddenException([this.message = "Forbidden"]);

  @override
  String toString() => message;
}

class RequestTimeoutException implements Exception {
  final String message;
  const RequestTimeoutException([this.message = "Request Timeout"]);

  @override
  String toString() => message;
}

class NotImplementedException implements Exception {
  final String message;
  const NotImplementedException([this.message = "Not Implemented"]);

  @override
  String toString() => message;
}

class BadRequestException implements Exception {
  final String message;
  const BadRequestException([this.message = "Bad Request"]);

  @override
  String toString() => message;
}

class UnProcessableEntityException implements Exception {
  final String message;
  const UnProcessableEntityException([this.message = "Unprocessable Entity"]);

  @override
  String toString() => message;
}

class NotFoundException implements Exception {
  final String message;
  const NotFoundException([this.message = "Not Found"]);

  @override
  String toString() => message;
}

class UnAuthorizedException implements Exception {
  final String message;
  const UnAuthorizedException([this.message = "Un Authorized"]);

  @override
  String toString() => message;
}

class FetchDataException implements Exception {
  final String message;
  const FetchDataException([this.message = "Fetch Data Exception"]);

  @override
  String toString() => message;
}

class ApiNotRespondingException implements Exception {
  final String message;
  const ApiNotRespondingException([this.message = "Api Not Responding"]);

  @override
  String toString() => message;
}
