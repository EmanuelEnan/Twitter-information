import 'dart:convert';

import 'package:twitter_api_1/api_model.dart';
import 'package:twitter_api_1/tokens.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Tokens tokens = Tokens();

  Future<List<ApiModel>> getApi(String name) async {
    var slug = name;
    String url =
        'https://api.twitter.com/2/users/by/username/$slug?user.fields=created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld';

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
      return service.map((json) => ApiModel.fromJson(json)).toList();
      // return TwitterModel.fromJson(jsonDecode(resp));
      //
    } else {
      throw Exception('${response.statusCode}');
    }
  }
}
