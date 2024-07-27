import 'package:jaggy/features/news_display/data_sources/save_following/save_following_abs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalFollowingSave implements FollowingSave {
  static const _followedKey = 'followedNewsProviders';

  @override
  Future<List<String>> loadFollowedNewsProviders() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_followedKey) ?? [];
  }

  @override
  Future<void> addToFollowing(String id) async {
    print('INVOKED1');
    final prefs = await SharedPreferences.getInstance();
    final followedNewsProviders = await loadFollowedNewsProviders();
    if (!followedNewsProviders.contains(id)) {
      followedNewsProviders.add(id);
      final res =
          await prefs.setStringList(_followedKey, followedNewsProviders);
      print(res);
    }
  }

  @override
  Future<void> removeFromFollowing(String id) async {
    print('INVOKED1');

    final prefs = await SharedPreferences.getInstance();
    final followedNewsProviders = await loadFollowedNewsProviders();
    if (followedNewsProviders.contains(id)) {
      followedNewsProviders.remove(id);
      final res =
          await prefs.setStringList(_followedKey, followedNewsProviders);
      print(res);
    }
  }
}
