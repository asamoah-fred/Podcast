import 'package:get_it/get_it.dart';
import 'package:provider_demo/core/services/podcast.dart';
import 'package:provider_demo/utils/custom_http_client.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => CustomHttpClient());
  locator.registerLazySingleton(() => PodcastService());
}
