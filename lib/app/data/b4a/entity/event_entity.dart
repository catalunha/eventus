import 'package:eventus/app/core/models/event_model.dart';
import 'package:eventus/app/core/models/question_model.dart';
import 'package:eventus/app/data/b4a/entity/community_entity.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class EventEntity {
  static const String className = 'Event';
  EventModel fromParse(ParseObject parseObject) {
    Map<String, Question>? questions = <String, Question>{};
    Map<String, dynamic>? object =
        parseObject.get<Map<String, dynamic>>('classifications');
    if (object != null) {
      for (var item in object.entries) {
        questions[item.key] = Question.fromMap(item.value);
      }
    }
    EventModel model = EventModel(
      id: parseObject.objectId!,
      name: parseObject.get<String>('name'),
      description: parseObject.get<String>('description'),
      community: parseObject.get('community') != null
          ? CommunityEntity().fromParse(parseObject.get('community'))
          : null,
      isPublic: parseObject.get<bool>('isPublic'),
      photo: parseObject.get('photo')?.get('url'),
      vacancies: parseObject.get<int>('vacancies'),
      participants: parseObject.get<List<dynamic>>('participants') != null
          ? parseObject
              .get<List<dynamic>>('participants')!
              .map((e) => e.toString())
              .toList()
          : [],
      questions: questions,
    );
    return model;
  }

  // Future<ParseObject> toParse(EventModel model) async {
  //   final parseObject = ParseObject(EventEntity.className);
  //   if (model.id != null) {
  //     parseObject.objectId = model.id;
  //   }
  //   parseObject.set('name', model.name);
  //   parseObject.set('description', model.description);
  //   return parseObject;
  // }
}
