import 'package:eventus/app/core/models/event_model.dart';
import 'package:eventus/app/view/controllers/event/event_controller.dart';
import 'package:eventus/app/view/pages/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventCard extends StatelessWidget {
  final eventController = Get.find<EventController>();

  final EventModel eventModel;
  EventCard({Key? key, required this.eventModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          eventModel.photo != null && eventModel.photo!.isNotEmpty
              ? Image.network(
                  eventModel.photo!,
                )
              : Image.asset(AppAssets.splash),
          ListTile(
            title: Text(eventModel.name ?? '...'),
            // subtitle: Text(eventModel.boss!),
          ),
          // Wrap(
          //   children: [
          //     IconButton(
          //       onPressed: () => _personController.edit(eventModel.id!),
          //       icon: const Icon(Icons.edit),
          //     ),
          //     IconButton(
          //       onPressed: () =>
          //           _personController.getOperatorsList(eventModel.id!),
          //       icon: const Icon(Icons.people),
          //     ),
          //     IconButton(
          //       onPressed: () =>
          //           _personController.getInvolvedsList(eventModel.id!),
          //       icon: const Icon(Icons.people_outline),
          //     ),

          //     // IconButton(
          //     //   onPressed: () =>
          //     //       _personController.addDeleteLaw(eventModel.id!),
          //     //   icon: const Icon(Icons.crop_sharp),
          //     // ),
          //   ],
          // )
        ],
      ),
    );
  }
}
