// import 'dart:convert';

// ApiModel apiModelFromJson(String str) => ApiModel.fromJson(json.decode(str));

// String apiModelToJson(ApiModel data) => json.encode(data.toJson());

// class ApiModel {
//   ApiModel({
//     required this.data,
//   });

//   late Data data;

//   factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//       };
// }

// class Data {
//   Data({
//     required this.id,
//     required this.name,
//     required this.username,
//     // required this.location,
//   });

//   late String id;
//   late String name;
//   late String username;
//   // late String location;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         name: json["name"],
//         username: json["username"],
//         // location: json["location"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "username": username,
//         // "location": location,
//       };
// }

// // class TwitterModel {
// //   late String name;
// //   late String username;
// //   late String id;

// //   TwitterModel({required this.name, required this.username, required this.id});

// //   TwitterModel.fromJson(Map<String, dynamic> json)
// //       : name = '${json['data'] ['name']}',
// //         username = '${json['data'] ['username']}',
// //         id = '${json['data'] ['id']}';
// // }

class ApiModel {
  Data? data;

  ApiModel({this.data});

  ApiModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? profileImageUrl;
  Entities? entities;
  String? name;
  String? pinnedTweetId;
  String? location;
  String? id;
  PublicMetrics? publicMetrics;
  bool? protected;
  String? url;
  String? username;
  bool? verified;
  String? createdAt;
  String? description;

  Data(
      {this.profileImageUrl,
      this.entities,
      this.name,
      this.pinnedTweetId,
      this.location,
      this.id,
      this.publicMetrics,
      this.protected,
      this.url,
      this.username,
      this.verified,
      this.createdAt,
      this.description});

  Data.fromJson(Map<String, dynamic> json) {
    profileImageUrl = json['profile_image_url'] ?? 'no value';
    entities =
        json['entities'] != null ? Entities.fromJson(json['entities']) : null;
    name = json['name'] ?? 'no value';
    pinnedTweetId = json['pinned_tweet_id'] ?? 'No pinned tweet in this account';
    location = json['location'] ?? 'no value';
    id = json['id'] ?? 'no value';
    publicMetrics = json['public_metrics'] != null
        ? PublicMetrics.fromJson(json['public_metrics'])
        : null;
    protected = json['protected'] ?? 'no value';
    url = url != null ? json['url'] : 'There is no url';
    username = json['username'] ?? 'no value';
    verified = json['verified'] ?? 'no value';
    createdAt = json['created_at'] ?? 'no value';
    description = json['description'] ?? 'no value';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profile_image_url'] = profileImageUrl;
    if (entities != null) {
      data['entities'] = entities!.toJson();
    }
    data['name'] = name;

    data['pinned_tweet_id'] = pinnedTweetId;

    data['location'] = location;
    data['id'] = id;
    if (publicMetrics != null) {
      data['public_metrics'] = publicMetrics!.toJson();
    }
    data['protected'] = protected;
    data['url'] = url;
    data['username'] = username;
    data['verified'] = verified;
    data['created_at'] = createdAt;
    data['description'] = description;
    return data;
  }
}

class Entities {
  Url? url;

  Entities({this.url});

  Entities.fromJson(Map<String, dynamic> json) {
    url = json['url'] != null ? Url.fromJson(json['url']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (url != null) {
      data['url'] = url!.toJson();
    }
    return data;
  }
}

class Url {
  List<Urls>? urls;

  Url({this.urls});

  Url.fromJson(Map<String, dynamic> json) {
    if (json['urls'] != null) {
      urls = <Urls>[];
      json['urls'].forEach((v) {
        urls!.add(Urls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (urls != null) {
      data['urls'] = urls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Urls {
  int? start;
  int? end;
  String? url;
  String? expandedUrl;
  String? displayUrl;

  Urls({this.start, this.end, this.url, this.expandedUrl, this.displayUrl});

  Urls.fromJson(Map<String, dynamic> json) {
    start = json['start'] ?? 'no value';
    end = json['end'] ?? 'no value';
    url = json['url'] ?? 'no value';
    expandedUrl = json['expanded_url'] ?? 'no value';
    displayUrl = json['display_url'] ?? 'no value';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start'] = start;
    data['end'] = end;
    data['url'] = url;
    data['expanded_url'] = expandedUrl;
    data['display_url'] = displayUrl;
    return data;
  }
}

class PublicMetrics {
  int? followersCount;
  int? followingCount;
  int? tweetCount;
  int? listedCount;

  PublicMetrics(
      {this.followersCount,
      this.followingCount,
      this.tweetCount,
      this.listedCount});

  PublicMetrics.fromJson(Map<String, dynamic> json) {
    followersCount = json['followers_count'] ?? 'no value';
    followingCount = json['following_count'] ?? 'no value';
    tweetCount = json['tweet_count'] ?? 'no value';
    listedCount = json['listed_count'] ?? 'no value';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['followers_count'] = followersCount;
    data['following_count'] = followingCount;
    data['tweet_count'] = tweetCount;
    data['listed_count'] = listedCount;
    return data;
  }
}

// To parse this JSON data, do
//
//     final apiModel = apiModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final apiModel = apiModelFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// ApiModel apiModelFromJson(String str) => ApiModel.fromJson(json.decode(str));

// String apiModelToJson(ApiModel data) => json.encode(data.toJson());

// class ApiModel {
//     ApiModel({
//         required this.data,
//     });

//     final Data? data;

//     factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": data == null ? null : data!.toJson(),
//     };
// }

// class Data {
//     Data({
//         required this.profileImageUrl,
//         required this.entities,
//         required this.name,
//         required this.pinnedTweetId,
//         required this.location,
//         required this.id,
//         required this.publicMetrics,
//         required this.protected,
//         required this.url,
//         required this.username,
//         required this.verified,
//         required this.createdAt,
//         required this.description,
//     });

//     final String profileImageUrl;
//     final Entities? entities;
//     final String name;
//     final String pinnedTweetId;
//     final String location;
//     final String id;
//     final PublicMetrics? publicMetrics;
//     final bool protected;
//     final String url;
//     final String username;
//     final bool verified;
//     final DateTime? createdAt;
//     final String description;

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         profileImageUrl: json["profile_image_url"] == null ? null : json["profile_image_url"],
//         entities: json["entities"] == null ? null : Entities.fromJson(json["entities"]),
//         name: json["name"] == null ? null : json["name"],
//         pinnedTweetId: json["pinned_tweet_id"] == null ? null : json["pinned_tweet_id"],
//         location: json["location"] == null ? null : json["location"],
//         id: json["id"] == null ? null : json["id"],
//         publicMetrics: json["public_metrics"] == null ? null : PublicMetrics.fromJson(json["public_metrics"]),
//         protected: json["protected"] == null ? null : json["protected"],
//         url: json["url"] == null ? null : json["url"],
//         username: json["username"] == null ? null : json["username"],
//         verified: json["verified"] == null ? null : json["verified"],
//         createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//         description: json["description"] == null ? null : json["description"],
//     );

//     Map<String, dynamic> toJson() => {
//         "profile_image_url": profileImageUrl == null ? null : profileImageUrl,
//         "entities": entities == null ? null : entities!.toJson(),
//         "name": name == null ? null : name,
//         "pinned_tweet_id": pinnedTweetId == null ? null : pinnedTweetId,
//         "location": location == null ? null : location,
//         "id": id == null ? null : id,
//         "public_metrics": publicMetrics == null ? null : publicMetrics!.toJson(),
//         "protected": protected == null ? null : protected,
//         "url": url == null ? null : url,
//         "username": username == null ? null : username,
//         "verified": verified == null ? null : verified,
//         "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
//         "description": description == null ? null : description,
//     };
// }

// class Entities {
//     Entities({
//         required this.url,
//     });

//     final EntitiesUrl? url;

//     factory Entities.fromJson(Map<String, dynamic> json) => Entities(
//         url: json["url"] == null ? null : EntitiesUrl.fromJson(json["url"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "url": url == null ? null : url!.toJson(),
//     };
// }

// class EntitiesUrl {
//     EntitiesUrl({
//         required this.urls,
//     });

//     final List<UrlElement>? urls;

//     factory EntitiesUrl.fromJson(Map<String, dynamic> json) => EntitiesUrl(
//         urls: json["urls"] == null ? null : List<UrlElement>.from(json["urls"].map((x) => UrlElement.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "urls": urls == null ? null : List<dynamic>.from(urls!.map((x) => x.toJson())),
//     };
// }

// class UrlElement {
//     UrlElement({
//         required this.start,
//         required this.end,
//         required this.url,
//         required this.expandedUrl,
//         required this.displayUrl,
//     });

//     final int start;
//     final int end;
//     final String url;
//     final String expandedUrl;
//     final String displayUrl;

//     factory UrlElement.fromJson(Map<String, dynamic> json) => UrlElement(
//         start: json["start"] == null ? null : json["start"],
//         end: json["end"] == null ? null : json["end"],
//         url: json["url"] == null ? null : json["url"],
//         expandedUrl: json["expanded_url"] == null ? null : json["expanded_url"],
//         displayUrl: json["display_url"] == null ? null : json["display_url"],
//     );

//     Map<String, dynamic> toJson() => {
//         "start": start == null ? null : start,
//         "end": end == null ? null : end,
//         "url": url == null ? null : url,
//         "expanded_url": expandedUrl == null ? null : expandedUrl,
//         "display_url": displayUrl == null ? null : displayUrl,
//     };
// }

// class PublicMetrics {
//     PublicMetrics({
//         required this.followersCount,
//         required this.followingCount,
//         required this.tweetCount,
//         required this.listedCount,
//     });

//     final int followersCount;
//     final int followingCount;
//     final int tweetCount;
//     final int listedCount;

//     factory PublicMetrics.fromJson(Map<String, dynamic> json) => PublicMetrics(
//         followersCount: json["followers_count"] == null ? null : json["followers_count"],
//         followingCount: json["following_count"] == null ? null : json["following_count"],
//         tweetCount: json["tweet_count"] == null ? null : json["tweet_count"],
//         listedCount: json["listed_count"] == null ? null : json["listed_count"],
//     );

//     Map<String, dynamic> toJson() => {
//         "followers_count": followersCount == null ? null : followersCount,
//         "following_count": followingCount == null ? null : followingCount,
//         "tweet_count": tweetCount == null ? null : tweetCount,
//         "listed_count": listedCount == null ? null : listedCount,
//     };
// }
