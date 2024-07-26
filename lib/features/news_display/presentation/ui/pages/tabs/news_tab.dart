import 'package:flutter/material.dart';
import 'package:jaggy/common/enums/news_coverage_enum.dart';

import '../../components/news_tile_c.dart';

class NewsTab extends StatefulWidget {
  final NewsCoverageEnum newsCoverage;
  const NewsTab({super.key, required this.newsCoverage});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [NewsTileC(
      about: "europe",
      content: "",
      headline: "Hello i am headlineHello i am headlineHello i am headlineHello i am headlineHello i am headline",
      newsAgent: "BBC",
      publishedAt: DateTime.now(),
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9Gvl-o1u8qzqRu_D5UhHh9_-pczQBMluwaA&s",
    ),NewsTileC(
      about: "europe",
      content: "",
      headline: "Hello i am headlineHello i am headlineHello i am headlineHello i am headlineHello i am headline",
      newsAgent: "BBC",
      publishedAt: DateTime.now(),
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9Gvl-o1u8qzqRu_D5UhHh9_-pczQBMluwaA&s",
    ),NewsTileC(
      about: "europe",
      content: "",
      headline: "Hello i am headlineHello i am headlineHello i am headlineHello i am headlineHello i am headline",
      newsAgent: "BBC",
      publishedAt: DateTime.now(),
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9Gvl-o1u8qzqRu_D5UhHh9_-pczQBMluwaA&s",
    )],);
  }
}
