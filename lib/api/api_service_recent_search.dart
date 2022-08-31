import 'dart:convert';

import 'package:twitter_api_1/api_model_recent_search.dart';
import 'package:twitter_api_1/tokens.dart';
import 'package:http/http.dart' as http;

class ApiServiceRecentSearch {
  Tokens tokens = Tokens();

  Future<List<ApiModelRecentSearch>> getApi(String searchTerm) async {
    var slug = searchTerm;
    String url =
        'https://api.twitter.com/2/tweets/search/recent?query=$slug lang:en -is:retweet &max_results=100&tweet.fields=conversation_id,created_at,id,possibly_sensitive,reply_settings,text,withheld&expansions=author_id';

    // Map<String, List<String>> qParams = {
    //   'user.fields': ['created_at', 'description', 'entities'],
    // };

    Uri uri = Uri.parse(url);
    // final finalUri = uri.replace(queryParameters: qParams);

    final response = await http.get(
      uri,
      headers: {
        "Authorization": tokens.bearerToken,
        "User-Agent": "v2UserLookupJS",
      },
    );

    // final resp = response.body;
    // print(resp);

    if (response.statusCode == 200) {
      print(response.statusCode);
      final resp = '[${response.body}]';
      print(resp);
      // Map services = jsonDecode(resp);
      List service = (jsonDecode(resp) as List<dynamic>);
      return service
          .map((json) => ApiModelRecentSearch.fromJson(json))
          .toList();
      // return ApiModelRecentSearch.fromJson(jsonDecode(resp));
      //
    } else {
      throw Exception('${response.statusCode}');
    }
  }
}
