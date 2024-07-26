import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaggy/common/enums/news_coverage_enum.dart';
import 'package:jaggy/common/extentions/spacer_ext.dart';
import 'package:jaggy/common/styles/text_styles.dart';
import 'package:jaggy/features/news_display/presentation/ui/pages/tabs/news_tab.dart';

class NewsHeadlinesPage extends StatefulWidget {
  const NewsHeadlinesPage({super.key});

  @override
  State<NewsHeadlinesPage> createState() => _NewsHeadlinesPageState();
}

class _NewsHeadlinesPageState extends State<NewsHeadlinesPage> {
  int defaultTab = 0;
  @override
  Widget build(BuildContext context) {
    final tTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 8,
      initialIndex: defaultTab,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/img/khabar.png'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Latest',
                  ),
                  InkWell(
                    child: Text('See all'),
                    onTap: () {
                      setState(() {
                        defaultTab = defaultTab < 4 ? 5 : 0;
                        print(defaultTab);
                      });
                    },
                  )
                ],
              ),
            ),
            20.ht,
            TabBar(
              unselectedLabelStyle: tTheme.bodyMedium,
              labelStyle: HeadlineBlack,
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Sports'),
                Tab(text: 'Politics'),
                Tab(text: 'Business'),
                Tab(text: 'Health'),
                Tab(text: 'Travel'),
                Tab(text: 'Science'),
                Tab(text: 'Fashion'),
              ],
              isScrollable: true,
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
            ),
            Expanded(
              child: TabBarView(
                  children: NewsCoverageEnum.values
                      .map((e) => NewsTab(newsCoverage: e))
                      .toList()),
            )
          ],
        ),
      ),
    );
  }
}
