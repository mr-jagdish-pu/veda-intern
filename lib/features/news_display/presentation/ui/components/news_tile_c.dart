import 'package:flutter/material.dart';
import 'package:jaggy/common/extentions/spacer_ext.dart';
import 'package:jaggy/common/styles/text_styles.dart';

class NewsTileC extends StatelessWidget {
  final String about;
  final String image;
  final String headline;
  final String newsAgent;
  final DateTime publishedAt;
  final String content;
  const NewsTileC({
    super.key,
    required this.about,
    required this.headline,
    required this.newsAgent,
    required this.publishedAt,
    required this.image,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
                fit: BoxFit.fill, height: 80, width: 70, '$image'),
          ),
          5.wd,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$about',
                style: SimpleThinGrey,
              ),
              2.ht,
              SizedBox(
                  width: mq - 100,
                  child: Text(
                    "$headline",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: HeadlineBlack.copyWith(height: 1.2),
                  )),
              2.ht,
              Row(
                children: [
                  Text(
                    "$newsAgent",
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
                        ' 14 min ago',
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
