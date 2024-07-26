import 'package:flutter/material.dart';
import 'package:jaggy/common/extentions/spacer_ext.dart';
import 'package:jaggy/common/styles/text_styles.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

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
                      "BBC News",
                      style: HeadlineBlack,
                    ),
                    Text(
                      "14 min ago",
                      style: SimpleThinGrey,
                    ),
                  ],
                ),
                Spacer(),
                FilledButton(onPressed: () {}, child: Text('Follow'))
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
            Text('Europe'),
            10.ht,
            Text(
              "Ukraine's President Zelensky to BBC: Blood money being paid for Russian oil",
              style: HeadlineBlack.copyWith(fontSize: 18),
            ),
            15.ht,
            Text(
                """Ukrainian President Volodymyr Zelensky has accused European countries that continue to buy Russian oil of "earning their money in other people's blood".

In an interview with the BBC, President Zelensky singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales, from which Russia stands to make up to £250bn (\$326bn) this year.

There has been a growing frustration among Ukraine's leadership with Berlin, which has backed some sanctions against Russia but so far resisted calls to back tougher action on oil sales."""),
            10.ht,
            FilledButton(onPressed: () {}, child: Text('Full News Here...'))
          ],
        ),
      ),
    );
  }
}
