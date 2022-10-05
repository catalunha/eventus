import 'package:eventus/app/view/controllers/event/event_controller.dart';
import 'package:eventus/app/view/pages/event/parts/event_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventList extends StatelessWidget {
  final eventController = Get.find<EventController>();

  EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(child: Column(children: list())));
  }

  List<Widget> list() {
    List<Widget> list = [];
    list.addAll(eventController.eventList
        .map((e) => EventCard(eventModel: e))
        .toList());
    return list;
  }
}
