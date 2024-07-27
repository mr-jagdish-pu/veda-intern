part of 'news_provider_cubit.dart';

// lib/cubits/news_state.dart

abstract class NewsState {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<NewsModel> allNews;
  final List<NewsModel> sportsNews;
  final List<NewsModel> healthNews;
  final List<NewsModel> politicsNews;
  final List<NewsModel> businessNews;
  final List<NewsModel> entertainmentNews;
  final List<NewsModel> scienceNews;
  final List<NewsModel> technologyNews;

  const NewsLoaded(
      {required this.allNews,
      required this.sportsNews,
      required this.healthNews,
      required this.politicsNews,
      required this.businessNews,
      required this.entertainmentNews,
      required this.scienceNews,
      required this.technologyNews});
}

class NewsError extends NewsState {
  final String message;

  const NewsError({required this.message});
}
