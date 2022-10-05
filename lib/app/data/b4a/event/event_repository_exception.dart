class EventRepositoryException implements Exception {
  final int code;
  final String message;
  EventRepositoryException({
    required this.code,
    required this.message,
  });
}
