import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/theme/model/NewsResponse.dart';
import 'package:news_app/core/theme/model/Sources_response.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '06c207ebcfc24697a20a9290f41e6782';

  static Future<SourcesResponse> getSources(String categoryId) async {
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources', {
      'apiKey': apiKey,
      'category': categoryId,
    });

    var response = await http.get(url);
    return SourcesResponse.fromJson(jsonDecode(response.body));
  }

  // https://newsapi.org/v2/everything?apiKey=06c207ebcfc24697a20a9290f41e6782&
// sources=bbc-sport
  static Future<NewsResponse> getNews({String? sourceId, String? query}) async {
    var url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': apiKey,
      'sources': sourceId,
      'q': query,
    });
    var responce = await http.get(url);
    return NewsResponse.fromJson(jsonDecode(responce.body));
  }
}
