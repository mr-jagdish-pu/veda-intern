import 'package:flutter/material.dart';
import 'package:jaggy/common/enums/news_coverage_enum.dart';

class NewsTab extends StatefulWidget {
  final NewsCoverageEnum newsCoverage;
  const NewsTab({super.key, required this.newsCoverage});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
