import 'package:jaggy/common/enums/news_coverage_enum.dart';

abstract class NewsDataSource {
  Future getAllNews();
  Future getNewsFromCategory(NewsCoverageEnum newsCategory);
}
