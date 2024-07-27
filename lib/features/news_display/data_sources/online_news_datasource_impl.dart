import 'package:dio/dio.dart';
import 'package:jaggy/common/constants/api_constant.dart';
import 'package:jaggy/common/enums/news_coverage_enum.dart';
import 'package:jaggy/common/extentions/news_coverage_ext.dart';
import 'package:jaggy/features/news_display/data_sources/news_data_source.dart';
import 'package:jaggy/features/news_display/model/news_model.dart';

class OnlineNewsDatasourceImpl implements NewsDataSource {
  final Dio _dio = Dio();

  @override
  Future<List<NewsModel>> getNewsFromCategory(
      NewsCoverageEnum newsCategory) async {
    String all_req_url =
        '${ApiConstant.BASE_URL}${ApiConstant.DEFAULT_PATH}?apiKey=${ApiConstant.API_KEY}&sources=bbc-news&pageSize=40';
    String reqUrl =
        "${ApiConstant.BASE_URL}${ApiConstant.DEFAULT_PATH}?apiKey=${ApiConstant.API_KEY}&category=${newsCategory.title}&pageSize=40&country=ca";

    print(reqUrl);
    final rawResponse = await _dio
        .get(newsCategory == NewsCoverageEnum.general ? all_req_url : reqUrl);
    final rawResponseData = rawResponse.data;

    final List<dynamic> rawNews = rawResponseData["articles"];
    final List<Map<String, dynamic>> listOfMapRawNews =
        rawNews.map((e) => e as Map<String, dynamic>).toList();

    final List<NewsModel> newsModel =
        listOfMapRawNews.map((e) => NewsModel.fromMap(e)).toList();
    print(newsModel.length);

    return newsModel;
  }
}
