import 'dart:convert';

import 'package:twitter_api_1/api_model_entity_choice.dart';
import 'package:twitter_api_1/api_model_recent_search.dart';
import 'package:twitter_api_1/tokens.dart';
import 'package:http/http.dart' as http;

class ApiServiceEntityChoice {
  Tokens tokens = Tokens();

  Future<List<ApiModelEntityChoice>> getApi() async {
    var id = 1271615071483985920;
    String url =
        'https://api.twitter.com/2/lists/$id/tweets?tweet.fields=context_annotations&user.fields=name,username';
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
          .map((json) => ApiModelEntityChoice.fromJson(json))
          .toList();
      // return ApiModelRecentSearch.fromJson(jsonDecode(resp));
      //
    } else {
      throw Exception('${response.statusCode}');
    }
  }
}
