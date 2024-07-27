import 'package:flutter/material.dart';
import 'package:jaggy/common/extentions/spacer_ext.dart';
import 'package:jaggy/common/styles/text_styles.dart';

import '../../../../../common/helper_functions/date_formatter.dart';
import '../../../model/news_model.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsModel newsModel;
  const NewsDetailPage({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                ),
                5.wd,
                Column(
                  children: [
                    Text(
                      newsModel.source.name,
                      style: HeadlineBlack,
                    ),
                    Text(
                      formatDateDifference(newsModel.publishedAt),
                      style: SimpleThinGrey,
                    ),
                  ],
                ),
                Spacer(),
                FilledButton(onPressed: () async {}, child: Text('Follow'))
              ],
            ),
            10.ht,
            Container(
              decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(10)),
              height: 250,
            ),
            10.ht,
            Text(newsModel.author),
            10.ht,
            Text(
              newsModel.title,
              style: HeadlineBlack.copyWith(fontSize: 18),
            ),
            15.ht,
            Text(""" ${newsModel.content}"""),
            10.ht,
            FilledButton(onPressed: () {}, child: Text('Full News Here...'))
          ],
        ),
      ),
    );
  }
}
