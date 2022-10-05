import 'package:eventus/app/core/models/event_model.dart';
import 'package:eventus/app/data/b4a/entity/community_entity.dart';
import 'package:eventus/app/data/b4a/entity/event_entity.dart';
import 'package:eventus/app/data/repositories/event_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class EventRepositoryB4a implements EventRepository {
  Future<QueryBuilder<ParseObject>> getQueryAll(String? communityId) async {
    if (communityId != null) {
      QueryBuilder<ParseObject> queryCommunity =
          QueryBuilder<ParseObject>(ParseObject(EventEntity.className));
      queryCommunity.whereEqualTo('community',
          ParseObject(CommunityEntity.className)..objectId = communityId);
      queryCommunity.whereEqualTo('isDeleted', false);
      QueryBuilder<ParseObject> queryPublic =
          QueryBuilder<ParseObject>(ParseObject(EventEntity.className));
      queryPublic.whereEqualTo('isPublic', true);
      queryPublic.whereEqualTo('isDeleted', false);

      QueryBuilder<ParseObject> mainQuery = QueryBuilder.or(
        ParseObject(EventEntity.className),
        [queryCommunity, queryPublic],
      );
      // includeObject does not come in this query
      mainQuery.orderByAscending('name');
      mainQuery.includeObject(['community']);

      return mainQuery;
    } else {
      QueryBuilder<ParseObject> queryPublic =
          QueryBuilder<ParseObject>(ParseObject(EventEntity.className));
      queryPublic.whereEqualTo('isPublic', true);
      queryPublic.whereEqualTo('isDeleted', false);
      return queryPublic;
    }
  }

  @override
  Future<List<EventModel>> list(String? communityId) async {
    QueryBuilder<ParseObject> query;
    query = await getQueryAll(communityId);

    final ParseResponse response = await query.query();
    List<EventModel> listTemp = <EventModel>[];
    if (response.success && response.results != null) {
      for (var element in response.results!) {
        //print((element as ParseObject).objectId);
        listTemp.add(EventEntity().fromParse(element));
      }
      return listTemp;
    } else {
      //print('Sem Events...');
      return [];
    }
  }
}
