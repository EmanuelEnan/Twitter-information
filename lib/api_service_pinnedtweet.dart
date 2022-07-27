import 'dart:convert';

import 'package:twitter_api_1/api_model.dart';
import 'package:twitter_api_1/api_model_pinnedtweet.dart';
import 'package:twitter_api_1/tokens.dart';
import 'package:http/http.dart' as http;

class ApiServicePinnedTweet {
  Tokens tokens = Tokens();

  Future<List<ApiModelPinnedTweet>> getApi(String pinnedTweetId) async {
    var slug = pinnedTweetId;
    String url =
        "https://api.twitter.com/2/tweets/$slug?tweet.fields=attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,possibly_sensitive,public_metrics,referenced_tweets,reply_settings,source,text,withheld&expansions=attachments.poll_ids,attachments.media_keys,author_id,geo.place_id,in_reply_to_user_id,referenced_tweets.id,entities.mentions.username,referenced_tweets.id.author_id&media.fields=duration_ms,height,media_key,preview_image_url,public_metrics,type,url,width&place.fields=contained_within,country,country_code,full_name,geo,id,name,place_type";

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
      return service.map((json) => ApiModelPinnedTweet.fromJson(json)).toList();
      // return ApiModelPinnedTweet.fromJson(jsonDecode(resp));
      //
    } else {
      throw Exception('${response.statusCode}');
    }
  }
}
