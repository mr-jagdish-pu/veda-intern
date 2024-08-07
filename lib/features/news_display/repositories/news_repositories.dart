import 'package:jaggy/common/enums/news_coverage_enum.dart';
import 'package:jaggy/features/news_display/model/news_model.dart';

import '../data_sources/news_data_source.dart';

class NewsRepository {
  final NewsDataSource newsDataSource;
  NewsRepository(this.newsDataSource);

  Future<List<NewsModel>> getAllNews(NewsCoverageEnum ne) async {
    return await newsDataSource.getNewsFromCategory(ne);
  }
}
