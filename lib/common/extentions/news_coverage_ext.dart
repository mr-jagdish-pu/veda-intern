import '../enums/news_coverage_enum.dart';

extension NewsCoverageEnumExtension on NewsCoverageEnum {
  String get title {
    switch (this) {
      case NewsCoverageEnum.all:
        return 'All';
      case NewsCoverageEnum.sports:
        return 'Sports';
      case NewsCoverageEnum.politics:
        return 'Politics';
      case NewsCoverageEnum.business:
        return 'Business';
      case NewsCoverageEnum.health:
        return 'Health';
      case NewsCoverageEnum.travel:
        return 'Travel';
      case NewsCoverageEnum.science:
        return 'Science';
      case NewsCoverageEnum.fashion:
        return 'Fashion';
    }
  }
}