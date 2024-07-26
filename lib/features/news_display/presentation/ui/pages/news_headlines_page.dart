import 'package:flutter/material.dart';
import 'package:jaggy/common/extentions/spacer_ext.dart';

class NewsHeadlinesPage extends StatefulWidget {
  const NewsHeadlinesPage({super.key});

  @override
  State<NewsHeadlinesPage> createState() => _NewsHeadlinesPageState();
}

class _NewsHeadlinesPageState extends State<NewsHeadlinesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      initialIndex: 0,

      child: Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('Latest'), Text('See all')],),
          ),
          20.ht,
          TabBar(tabs: [
            Tab(text: 'All'),
            Tab(text: 'Sports'),
            Tab(text: 'Politics'),
            Tab(text: 'Business'),
            Tab(text: 'Health'),
            Tab(text: 'Travel'),
            Tab(text: 'Science'),
            Tab(text: 'Fashion'),
          ],isScrollable: true, dividerColor: Colors.transparent, )

        ],),
      ),
    );
  }
}
