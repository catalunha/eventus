import 'package:eventus/app/data/b4a/profile/profile_repository_b4a.dart';
import 'package:eventus/app/data/repositories/profile_repository.dart';
import 'package:eventus/app/view/controllers/profile/profile_controller.dart';
import 'package:get/get.dart';

class UserProfileDependencies implements Bindings {
  @override
  void dependencies() {
    Get.put<ProfileRepository>(
      ProfileRepositoryB4a(),
    );
    // Get.put<UserProfileUseCase>(
    //   UserProfileUseCaseImpl(userProfileRepository: Get.find()),
    // );
    Get.lazyPut<ProfileController>(
      () => ProfileController(
        profileRepository: Get.find(),
      ),
    );
  }
}
