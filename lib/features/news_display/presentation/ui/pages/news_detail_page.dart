import 'package:flutter/material.dart';
import 'package:jaggy/common/extentions/spacer_ext.dart';
import 'package:jaggy/common/styles/text_styles.dart';
import 'package:jaggy/features/news_display/presentation/provider/news_follower_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
          IconButton(
              onPressed: () {
                Share.share('Visit Full News: ${newsModel.url}');
              },
              icon: Icon(Icons.share_outlined)),
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('This feature is comming soon..'),
                  duration: Duration(milliseconds: 500),
                ));
              },
              icon: Icon(Icons.more_vert))
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
                    child: Text(
                      newsModel.source.name[0],
                      style: HeadlineBlack.copyWith(fontSize: 20),
                    )),
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
                Builder(builder: (context) {
                  return Consumer<NewsFollowerProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return FilledButton(
                          onPressed: () async {
                            print(value.isFollowing(newsModel.source.id));
                            if (value.isFollowing(newsModel.source.id)) {
                              await Provider.of<NewsFollowerProvider>(context,
                                      listen: false)
                                  .unfollowNewsProvider(newsModel.source.id);
                            } else {
                              await Provider.of<NewsFollowerProvider>(context,
                                      listen: false)
                                  .followNewsProvider(newsModel.source.id);
                            }
                            print(value.followedNewsProviders);
                          },
                          child: value.isFollowing(newsModel.source.id)
                              ? Text('Following')
                              : Text("Follow"));
                    },
                  );
                })
              ],
            ),
            10.ht,
            Container(
              child: Image.network(
                newsModel.urlToImage,
                errorBuilder: (a, b, c) {
                  return Center(child: Text('No Image Provided'));
                },
              ),
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
            newsModel.content.isEmpty
                ? Text(
                    'This news content section doesn\'t contain any content. Nevertheless, following button navigates you to original website.')
                : Text(newsModel.content),
            10.ht,
            FilledButton(
                onPressed: () async {
                  print('Helloooooooosdoosdooso');
                  if (await canLaunchUrl(Uri.parse(newsModel.url))) {
                    launchUrl(Uri.parse(newsModel.url));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid url, cannot launch')));
                  }
                },
                child: Text('Full News Here...'))
          ],
        ),
      ),
    );
  }
}
