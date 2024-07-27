import 'package:flutter/foundation.dart';

import '../../data_sources/save_following/save_following_abs.dart';

class NewsFollowerProvider with ChangeNotifier {
  final FollowingSave _followingSave;
  List<String> _followedNewsProviders = [];

  NewsFollowerProvider(this._followingSave) {
    _loadFollowedNewsProviders();
  }

  List<String> get followedNewsProviders => _followedNewsProviders;

  Future<void> _loadFollowedNewsProviders() async {
    _followedNewsProviders = await _followingSave.loadFollowedNewsProviders();
    notifyListeners();
  }

  Future<void> followNewsProvider(String id) async {
    print(4545);
    if (!_followedNewsProviders.contains(id)) {
      await _followingSave.addToFollowing(id);
      _followedNewsProviders.add(id);
      notifyListeners();
    }
  }

  Future<void> unfollowNewsProvider(String id) async {
    print(454588);
    if (_followedNewsProviders.contains(id)) {
      await _followingSave.removeFromFollowing(id);
      _followedNewsProviders.remove(id);
      notifyListeners();
    }
  }

  bool isFollowing(String id) {
    return _followedNewsProviders.contains(id);
  }
}
