import 'package:eventus/app/core/models/event_model.dart';

abstract class EventRepository {
  Future<List<EventModel>> list(String? communityId);
}
