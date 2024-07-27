abstract class FollowingSave {
  Future<List<String>> loadFollowedNewsProviders();
  Future<void> addToFollowing(String id);
  Future<void> removeFromFollowing(String id);
}
