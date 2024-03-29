import 'package:eventus/app/core/models/profile_model.dart';
import 'package:eventus/app/data/b4a/entity/profile_entity.dart';
import 'package:eventus/app/data/b4a/profile/profile_repository_exception.dart';
import 'package:eventus/app/data/repositories/profile_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ProfileRepositoryB4a implements ProfileRepository {
  @override
  Future<String> create(ProfileModel profileModel) async {
    //print('userProfile Repo create');
    //print(profileModel);

    final userProfileParse = await ProfileEntity().toParse(profileModel);
    //print(userProfileParse);
    final ParseResponse responseUserProfile = await userProfileParse.save();
    if (responseUserProfile.success && responseUserProfile.results != null) {
      ParseObject userProfile =
          responseUserProfile.results!.first as ParseObject;
      return userProfile.objectId!;
    } else {
      throw ProfileRepositoryException(
          code: '000', message: 'Não foi possivel fazer update');
    }
  }

  @override
  Future<String> update(ProfileModel profileModel) async {
    //print('ProfileRepositoryB4a.update');
    //print(profileModel);
    final userProfileParse = await ProfileEntity().toParse(profileModel);
    //print(userProfileParse);

    final ParseResponse responseUserProfile = await userProfileParse.save();
    if (responseUserProfile.success && responseUserProfile.results != null) {
      ParseObject userProfile =
          responseUserProfile.results!.first as ParseObject;
      return userProfile.objectId!;
    } else {
      throw ProfileRepositoryException(
          code: '000', message: 'Não foi possivel fazer update');
    }
  }
}
