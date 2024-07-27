import '../enums/news_coverage_enum.dart';

extension NewsCoverageEnumExtension on NewsCoverageEnum {
  String get title {
    switch (this) {
      case NewsCoverageEnum.general:
        return 'general';
      case NewsCoverageEnum.sports:
        return 'sports';
      case NewsCoverageEnum.politics:
        return 'politics';
      case NewsCoverageEnum.business:
        return 'business';
      case NewsCoverageEnum.health:
        return 'health';
      case NewsCoverageEnum.entertainment:
        return 'entertainment';
      case NewsCoverageEnum.science:
        return 'science';
      case NewsCoverageEnum.technology:
        return 'technology';
    }
  }
}
