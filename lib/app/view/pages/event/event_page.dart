import 'package:eventus/app/view/controllers/event/event_controller.dart';
import 'package:eventus/app/view/pages/event/parts/event_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventPage extends StatelessWidget {
  final operationController = Get.find<EventController>();

  EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listando eventos'),
      ),
      body: Column(children: [
        SingleChildScrollView(child: EventList()),
      ]),
    );
  }
}
