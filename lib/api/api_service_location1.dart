import 'dart:convert';

import 'package:twitter_api_1/api_model_location.dart';
import 'package:twitter_api_1/tokens.dart';
import 'package:http/http.dart' as http;

class ApiServiceLocation1 {
  Tokens tokens = Tokens();

  Future<ApiModelLoc> getApi1(int id, String token) async {
    var slug = id;
    String url = "https://api.twitter.com/2/users/$slug/followers?user.fields=public_metrics,location&pagination_token=$token";

    // Map<String, List<String>> qParams = {
    //   'user.fields': ['public_metrics', 'location'],
    // };

    // var hasNextPage = true;
    // var nextToken = null;

    // while(hasNextPage) {

    // }
    
    Uri uri = Uri.parse(url);
    // final finalUri = uri.replace(queryParameters: qParams);

    final response = await http.get(
      // finalUri,
      uri,
      headers: {
        "Authorization": tokens.bearerToken,
        "User-Agent": "v2UserLookupJS",
        // 'Access-Control-Allow-Headers': '*',
      },
    );

    // final resp = response.body;
    // print(resp);

    if (response.statusCode == 200) {
      print(response.statusCode);
      final resp = response.body;
      print(resp);
      // Map services = jsonDecode(resp);
      // List service = jsonDecode(resp);
      // return service.map((json) => ApiModelLoc.fromJson(json)).toList();
      return ApiModelLoc.fromJson(jsonDecode(resp));
      //
    } else {
      throw Exception('${response.statusCode}');
    }
  }
}
