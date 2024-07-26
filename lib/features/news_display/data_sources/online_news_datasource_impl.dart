import 'package:dio/dio.dart';
import 'package:jaggy/common/constants/api_constant.dart';
import 'package:jaggy/common/enums/news_coverage_enum.dart';
import 'package:jaggy/common/extentions/news_coverage_ext.dart';
import 'package:jaggy/features/news_display/data_sources/news_data_source.dart';
import 'package:jaggy/features/news_display/model/news_model.dart';

class OnlineNewsDatasourceImpl implements NewsDataSource {
  final Dio _dio = Dio();
  @override
  Future<List<NewsModel>> getAllNews() async {
    String reqUrl =
        "${ApiConstant.BASE_URL}${ApiConstant.DEFAULT_PATH}?apiKey=${ApiConstant.API_KEY}&sources=bbc-news";
    print('Ln 13: Request was:$reqUrl');
    final rawResponse = await _dio.get(reqUrl);
    final rawResponseData = rawResponse.data;

    final List<dynamic> rawNews = rawResponseData["articles"];
    final List<Map<String, dynamic>> listOfMapRawNews =
        rawNews.map((e) => e as Map<String, dynamic>).toList();

    final List<NewsModel> newsModel =
        listOfMapRawNews.map((e) => NewsModel.fromMap(e)).toList();

    return newsModel;
  }

  @override
  Future<List<NewsModel>> getNewsFromCategory(
      NewsCoverageEnum newsCategory) async {
    String reqUrl =
        "${ApiConstant.BASE_URL}${ApiConstant.DEFAULT_PATH}?apiKey=${ApiConstant.API_KEY}&sources=bbc-news&categoty=${newsCategory.title}";
    final rawResponse = await _dio.get(reqUrl);
    final rawResponseData = rawResponse.data;

    final List<dynamic> rawNews = rawResponseData["articles"];
    final List<Map<String, dynamic>> listOfMapRawNews =
        rawNews.map((e) => e as Map<String, dynamic>).toList();

    final List<NewsModel> newsModel =
        listOfMapRawNews.map((e) => NewsModel.fromMap(e)).toList();

    return newsModel;
  }
}
