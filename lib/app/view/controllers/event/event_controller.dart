import 'package:eventus/app/core/models/event_model.dart';
import 'package:eventus/app/data/repositories/event_repository.dart';
import 'package:eventus/app/view/controllers/auth/splash/splash_controller.dart';
import 'package:eventus/app/view/controllers/utils/loader_mixin.dart';
import 'package:eventus/app/view/controllers/utils/message_mixin.dart';
import 'package:get/get.dart';

class EventController extends GetxController with LoaderMixin, MessageMixin {
  final EventRepository _eventRepository;

  EventController({required EventRepository eventRepository})
      : _eventRepository = eventRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final eventList = <EventModel>[].obs;
  final _event = Rxn<EventModel>();
  EventModel? get event => _event.value;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    listAll();
  }

  void listAll() async {
    _loading(true);
    eventList.clear();
    final splashController = Get.find<SplashController>();
    String? communityId = splashController.userModel?.profile?.community?.id;
    print('communityId: $communityId');
    List<EventModel> temp = await _eventRepository.list(communityId);
    eventList.addAll([...temp]);
    print('listAll: ${eventList.length}');
    _loading(false);
  }
}
