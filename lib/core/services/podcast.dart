import 'package:provider_demo/core/models/best_podcast.dart';
import 'package:provider_demo/core/models/curated_podcasts.dart';
import 'package:provider_demo/core/services/locator.dart';
import 'package:provider_demo/utils/custom_http_client.dart';
import 'package:provider_demo/utils/endpoints.dart';

class PodcastService {
  CustomHttpClient httpService = locator<CustomHttpClient>();
  Future<BestPodcast> getBestPodcasts() async {
    final response = await httpService.get(url: bestPodcasts);
    if (httpService.isSuccessful(response)) {
      return bestPodcastFromJson(response.body);
    }
    return null;
  }

  Future<CuratedPodcast> getCuratedPodcasts() async {
    final response = await httpService.get(url: curatedPodcasts);
    if (httpService.isSuccessful(response)) {
      return curatedPodcastFromJson(response.body);
    }
    return null;
  }
}
