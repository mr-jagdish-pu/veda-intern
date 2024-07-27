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

class _NewsHeadlinesPageState extends State<NewsHeadlinesPage> {
  @override
  void initState() {
    //WidgetsBinding.instance.addPostFrameCallback()
    BlocProvider.of<NewsProviderCubit>(context).fetchNews();
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
