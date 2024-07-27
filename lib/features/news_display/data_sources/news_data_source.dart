import 'package:jaggy/common/enums/news_coverage_enum.dart';
import 'package:jaggy/features/news_display/model/news_model.dart';

abstract class NewsDataSource {
  Future<List<NewsModel>> getNewsFromCategory(NewsCoverageEnum newsCategory);
}
