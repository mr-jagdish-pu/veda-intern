import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaggy/common/enums/news_coverage_enum.dart';
import 'package:jaggy/common/extentions/spacer_ext.dart';
import 'package:jaggy/features/news_display/presentation/cubit/news_provider_cubit.dart';
import 'package:jaggy/features/news_display/presentation/ui/components/news_tile_c.dart';

import '../../../../model/news_model.dart';

class NewsTab extends StatefulWidget {
  final NewsCoverageEnum newsCoverage;

  const NewsTab({super.key, required this.newsCoverage});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsProviderCubit, NewsState>(builder: (ctx, state) {
      if (state is NewsInitial || state is NewsLoading) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              20.ht,
              Text("Loading Data")
            ],
          ),
        );
      } else if (state is NewsLoaded) {
        switch (widget.newsCoverage) {
          case NewsCoverageEnum.general:
            {
              final List<NewsModel> news = state.allNews;
              return ListView.builder(
                itemBuilder: (ctx, ind) {
                  return NewsTileC(news: news[ind]);
                },
                itemCount: news.length,
              );
            }

          case NewsCoverageEnum.sports:
            {
              final List<NewsModel> news = state.sportsNews;
              return ListView.builder(
                itemBuilder: (ctx, ind) {
                  return NewsTileC(news: news[ind]);
                },
                itemCount: news.length,
              );
            }
          case NewsCoverageEnum.politics:
            {
              final List<NewsModel> news = state.politicsNews;
              return ListView.builder(
                itemBuilder: (ctx, ind) {
                  return NewsTileC(news: news[ind]);
                },
                itemCount: news.length,
              );
            }
          case NewsCoverageEnum.business:
            {
              final List<NewsModel> news = state.businessNews;
              return ListView.builder(
                itemBuilder: (ctx, ind) {
                  return NewsTileC(news: news[ind]);
                },
                itemCount: news.length,
              );
            }
          case NewsCoverageEnum.health:
            {
              final List<NewsModel> news = state.healthNews;
              return ListView.builder(
                itemBuilder: (ctx, ind) {
                  return NewsTileC(news: news[ind]);
                },
                itemCount: news.length,
              );
            }
          case NewsCoverageEnum.entertainment:
            {
              final List<NewsModel> news = state.entertainmentNews;
              return ListView.builder(
                itemBuilder: (ctx, ind) {
                  return NewsTileC(news: news[ind]);
                },
                itemCount: news.length,
              );
            }
          case NewsCoverageEnum.science:
            {
              final List<NewsModel> news = state.scienceNews;
              return ListView.builder(
                itemBuilder: (ctx, ind) {
                  return NewsTileC(news: news[ind]);
                },
                itemCount: news.length,
              );
            }
          case NewsCoverageEnum.technology:
            {
              final List<NewsModel> news = state.technologyNews;
              return ListView.builder(
                itemBuilder: (ctx, ind) {
                  return NewsTileC(news: news[ind]);
                },
                itemCount: state.technologyNews.length - 1,
              );
            }
        }
      } else if (state is NewsError) {
        return Center(
          child: Text(state.message),
        );
      } else {
        return Container();
      }
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
