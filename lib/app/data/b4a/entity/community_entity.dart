import 'package:eventus/app/core/models/community_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CommunityEntity {
  static const String className = 'Community';
  CommunityModel fromParse(ParseObject parseObject) {
    print('CommunityEntity: ${parseObject.objectId}');
    print(
        "parseObject.get<String>('name'): ${parseObject.get<String>('name')}");

    CommunityModel model = CommunityModel(
      id: parseObject.objectId!,
      name: parseObject.get<String>('name'),
      coordinator: parseObject.get<String>('coordinator'),
      address: parseObject.get<String>('address'),
      isDeleted: parseObject.get<bool>('isDeleted'),
    );
    return model;
  }

  // Future<ParseObject> toParse(CommunityModel model) async {
  //   final parseObject = ParseObject(CommunityEntity.className);
  //   if (model.id != null) {
  //     parseObject.objectId = model.id;
  //   }
  //   parseObject.set('name', model.name);
  //   parseObject.set('description', model.description);
  //   return parseObject;
  // }
}
