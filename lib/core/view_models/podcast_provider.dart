import 'package:flutter/widgets.dart';
import 'package:provider_demo/core/services/locator.dart';
import 'package:provider_demo/core/services/podcast.dart';

class PodCastProvider extends ChangeNotifier {
  PodcastService _podcastService = locator<PodcastService>();
  String _errMessage;
  String get errorMessage => _errMessage;

  Future getBestPodcasts() async {
    _errMessage = null;
    try {
      final _result = await _podcastService.getBestPodcasts();
      notifyListeners();
      return _result.podcasts;
    } catch (e) {
      _errMessage = e.toString() ?? "Something went wrong, please try again";
      notifyListeners();
    }
  }

    Future getCuratedPodcasts() async {
    _errMessage = null;
    try {
      final _result = await _podcastService.getCuratedPodcasts();
      notifyListeners();
      return _result.curatedLists;
    } catch (e) {
      _errMessage = e.toString() ?? "Something went wrong, please try again";
      notifyListeners();
    }
  }
}
