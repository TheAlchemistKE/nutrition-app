import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/models/profile/profile_model.dart';
import 'package:nutrinowapp/models/profile/profile_recommendation_model.dart';
import 'package:nutrinowapp/models/recommendation/recommendation_model.dart';
import 'package:nutrinowapp/models/recommendation/suggested_recommendations_model.dart';
import 'package:nutrinowapp/service/app_service.dart';

class RecommendationService with AppService {
  static Future<List<ProfileRecommendationModel>> fetchProfileRecommendations(
      ProfileModel profile) async {
    var resp =
        await Api.api().get('/profile/${profile.profileHash}/recommendation');
    var models = <ProfileRecommendationModel>[];
    resp.forEach((i) => models.add(ProfileRecommendationModel.fromJson(i)));
    return Future.value(models);
  }

  static Future<List<SuggestedRecommendationsModel>>
      fetchSuggestedRecommendations(ProfileModel profile) async {
    var resp = await Api.api()
        .get('/profile/${profile.profileHash}/suggested-recommendation');
    var models = <SuggestedRecommendationsModel>[];
    resp.forEach((i) => models.add(SuggestedRecommendationsModel.fromJson(i)));
    return Future.value(models);
  }

  static Future<List<RecommendationModel>> fetchPublicRecommendations(
      ProfileModel? profile) async {
    // TODO:
    return Future.value([]);
  }
}
