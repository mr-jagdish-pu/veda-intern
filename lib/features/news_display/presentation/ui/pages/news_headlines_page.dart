import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaggy/common/enums/news_coverage_enum.dart';
import 'package:jaggy/common/extentions/news_coverage_ext.dart';
import 'package:jaggy/common/extentions/spacer_ext.dart';
import 'package:jaggy/common/styles/text_styles.dart';
import 'package:jaggy/features/news_display/presentation/cubit/news_provider_cubit.dart';
import 'package:jaggy/features/news_display/presentation/ui/pages/tabs/news_tab.dart';

class NewsHeadlinesPage extends StatefulWidget {
  const NewsHeadlinesPage({super.key});

  @override
  State<NewsHeadlinesPage> createState() => _NewsHeadlinesPageState();
}

class _NewsHeadlinesPageState extends State<NewsHeadlinesPage>
    with SingleTickerProviderStateMixin {
  late TabController tc;
  @override
  void initState() {
    //WidgetsBinding.instance.addPostFrameCallback()
    BlocProvider.of<NewsProviderCubit>(context).fetchNews();
    tc = TabController(length: 8, vsync: this);
    super.initState();
  }

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
            IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('This feature is comming soon..'),
                    duration: Duration(milliseconds: 500),
                  ));
                },
                icon: Icon(CupertinoIcons.bell))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Text(
                      'Latest',
                    ),
                    onTap: () {
                      BlocProvider.of<NewsProviderCubit>(context).fetchNews();
                    },
                  ),
                  InkWell(
                    child: Text('See all'),
                    onTap: () {
                      setState(() {
                        if (tc.index < 4) {
                          tc.animateTo(7);
                        } else {
                          tc.animateTo(1);
                        }

                        print(defaultTab);
                      });
                    },
                  )
                ],
              ),
            ),
            20.ht,
            TabBar(
              controller: tc,
              onTap: (int tab) {},
              unselectedLabelStyle: tTheme.bodyMedium,
              labelStyle: HeadlineBlack,
              tabs: NewsCoverageEnum.values
                  .map((e) => Tab(text: e.title.toUpperCase()))
                  .toList(),
              isScrollable: true,
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
            ),
            Expanded(
              child: TabBarView(
                  controller: tc,
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
