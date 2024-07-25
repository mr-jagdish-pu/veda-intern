import 'package:flutter/material.dart';
import 'package:jaggy/features/news_display/presentation/ui/components/news_tile_c.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [NewsTileC(
        about: "europe",
        content: "",
        headline: "Hello i am headlineHello i am headlineHello i am headlineHello i am headlineHello i am headline",
        newsAgent: "BBC",
        publishedAt: DateTime.now(),
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9Gvl-o1u8qzqRu_D5UhHh9_-pczQBMluwaA&s",
      )],),
    );
  }
}
