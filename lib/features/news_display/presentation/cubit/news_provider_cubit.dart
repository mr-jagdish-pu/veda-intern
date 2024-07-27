import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:jaggy/features/news_display/data_sources/online_news_datasource_impl.dart';

import '../../../../common/enums/news_coverage_enum.dart';
import '../../data_sources/news_data_source.dart';
import '../../model/news_model.dart';

part 'news_provider_state.dart';

class NewsProviderCubit extends Cubit<NewsState> {
  final NewsDataSource _newsService = OnlineNewsDatasourceImpl();
  NewsProviderCubit() : super(NewsInitial());
  Future<void> fetchNews() async {
    emit(NewsLoading());
    try {
      List<List<NewsModel>> allNews =
          await Future.wait(NewsCoverageEnum.values.map((e) async {
        return await _newsService.getNewsFromCategory(e);
      }));
      emit(NewsLoaded(
          allNews: allNews[0],
          sportsNews: allNews[1],
          politicsNews: allNews[2],
          businessNews: allNews[3],
          healthNews: allNews[4],
          entertainmentNews: allNews[5],
          scienceNews: allNews[6],
          technologyNews: allNews[7]));
      print(allNews.length);
    } on DioException catch (e) {
      emit(NewsError(message: e.message ?? ''));
    } catch (e) {
      emit(NewsError(message: 'Something went wrong'));
    }
  }
}
