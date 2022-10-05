import 'package:eventus/app/data/b4a/event/event_repository_b4a.dart';
import 'package:eventus/app/data/repositories/event_repository.dart';
import 'package:eventus/app/view/controllers/event/event_controller.dart';
import 'package:get/get.dart';

class EventBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventRepository>(
      () => EventRepositoryB4a(),
    );
    Get.put(EventController(
      eventRepository: Get.find(),
    ));
  }
}
