import 'package:flutter/material.dart';
import 'package:jaggy/common/extentions/spacer_ext.dart';
import 'package:jaggy/common/helper_functions/error_image.dart';
import 'package:jaggy/common/styles/text_styles.dart';
import 'package:jaggy/features/news_display/model/news_model.dart';

import '../../../../../common/helper_functions/date_formatter.dart';

class NewsTileC extends StatelessWidget {
  final NewsModel news;
  const NewsTileC({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    print(news.urlToImage);
    final mq = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
                errorBuilder: (ctx, o, st) => errorImage(),
                fit: BoxFit.fill,
                height: 80,
                width: 70,
                '${news.urlToImage}'),
          ),
          5.wd,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${news.author}',
                style: SimpleThinGrey,
              ),
              2.ht,
              SizedBox(
                  width: mq - 100,
                  child: Text(
                    "${news.title}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: HeadlineBlack.copyWith(height: 1.2),
                  )),
              2.ht,
              Row(
                children: [
                  Text(
                    "${news.source.name}",
                    style: SimpleBoldBlack,
                  ),
                  20.wd,
                  Wrap(
                    alignment: WrapAlignment.end,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        size: 15,
                        color: Colors.grey,
                      ),
                      Text(
                        formatDateDifference(news.publishedAt),
                        style: SimpleThinGrey,
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
