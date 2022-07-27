// import 'dart:convert';

// ApiModelLoc apiModelFromJson(String str) =>
//     ApiModelLoc.fromJson(json.decode(str));

// String apiModelToJson(ApiModelLoc data) => json.encode(data.toJson());

// class ApiModelLoc {
//   ApiModelLoc({
//     required this.data,
//   });

//   late Data? data;

//   factory ApiModelLoc.fromJson(Map<String, dynamic> json) => ApiModelLoc(
//         data: json["data"] == null ? null : Data.fromJson(json["data"]) ,
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data == null ? null : data?.toJson(),
//       };
// }

// class Data {
//   Data({
//     required this.id,
//     this.name,
//     required this.username,
//     this.location,
//   });

//   final String? id;
//   final String? name;
//   final String? username;
//   final String? location;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"] ?? 'empty',
//         name: json["name"] ?? 'empty',
//         username: json["username"] ?? 'empty',
//         location: json["location"] ?? 'no value',
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id ?? 'empty',
//         "name": name ?? 'empty',
//         "username": username ?? 'empty',
//         "location": location ?? 'no value',
//       };
// }

// To parse this JSON data, do
//
//     final apiModelLoc = apiModelLocFromJson(jsonString);

// import 'dart:convert';

// ApiModelLoc apiModelLocFromJson(String str) => ApiModelLoc.fromJson(json.decode(str));

// String apiModelLocToJson(ApiModelLoc data) => json.encode(data.toJson());

// class ApiModelLoc {
//     ApiModelLoc({
//         required this.data,
//         required this.meta,
//     });

//     final List<Datum> data;
//     final Meta meta;

//     factory ApiModelLoc.fromJson(Map<String, dynamic> json) => ApiModelLoc(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         meta: Meta.fromJson(json["meta"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "meta": meta.toJson(),
//     };
// }

// class Datum {
//     Datum({
//         required this.id,
//          this.username = '',
//          this.name = '',
//          this.location = '',
//     });

//     final String id;
//     final String username;
//     final String name;
//     final String location;

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"] ?? 'empty',
//         username: json["username"] ?? 'empty',
//         name: json["name"] ?? 'empty',
//         location: json["location"] ?? 'not given',
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "username": username,
//         "name": name,
//         "location": location,
//     };
// }

// class Meta {
//     Meta({
//         required this.resultCount,
//     });

//     final int resultCount;

//     factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         resultCount: json["result_count"],
//     );

//     Map<String, dynamic> toJson() => {
//         "result_count": resultCount,
//     };
// }

// To parse this JSON data, do
//
//     final apiModelLoc = apiModelLocFromJson(jsonString);

// import 'dart:convert';

// ApiModelLoc apiModelLocFromJson(String str) => ApiModelLoc.fromJson(json.decode(str));

// String apiModelLocToJson(ApiModelLoc data) => json.encode(data.toJson());

// class ApiModelLoc {
//     ApiModelLoc({
//         required this.data,
//         // required this.meta,
//     });

//     final List<Datum> data;
//     // final Meta meta;

//     factory ApiModelLoc.fromJson(Map<String, dynamic> json) => ApiModelLoc(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         // meta: Meta.fromJson(json["meta"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         // "meta": meta.toJson(),
//     };
// }

// class Datum {
//     Datum({
//         required this.id,
//         // required this.publicMetrics,
//         required this.username,
//         required this.name,
//         required this.location,
//     });

//     final String id;
//     // final PublicMetrics publicMetrics;
//     final String username;
//     final String name;
//     final String location;

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         // publicMetrics: PublicMetrics.fromJson(json["public_metrics"]),
//         username: json["username"],
//         name: json["name"],
//         location: json["location"] == null ? null : json["location"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         // "public_metrics": publicMetrics.toJson(),
//         "username": username,
//         "name": name,
//         "location": location == null ? null : location,
//     };
// }

// // class PublicMetrics {
// //     PublicMetrics({
// //         required this.followersCount,
// //         required this.followingCount,
// //         required this.tweetCount,
// //         required this.listedCount,
// //     });

// //     final int followersCount;
// //     final int followingCount;
// //     final int tweetCount;
// //     final int listedCount;

// //     factory PublicMetrics.fromJson(Map<String, dynamic> json) => PublicMetrics(
// //         followersCount: json["followers_count"],
// //         followingCount: json["following_count"],
// //         tweetCount: json["tweet_count"],
// //         listedCount: json["listed_count"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "followers_count": followersCount,
// //         "following_count": followingCount,
// //         "tweet_count": tweetCount,
// //         "listed_count": listedCount,
// //     };
// // }

// // class Meta {
// //     Meta({
// //         required this.resultCount,
// //     });

// //     final int resultCount;

// //     factory Meta.fromJson(Map<String, dynamic> json) => Meta(
// //         resultCount: json["result_count"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "result_count": resultCount,
// //     };
// // }

class ApiModelLoc {
  List<Data>? data;
  Meta? meta;

  ApiModelLoc({this.data, this.meta});

  ApiModelLoc.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  String? username;
  PublicMetrics? publicMetrics;
  String? id;
  String? name;
  String? location;

  Data({this.username, this.publicMetrics, this.id, this.name, this.location});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    publicMetrics = json['public_metrics'] != null
        ? PublicMetrics.fromJson(json['public_metrics'])
        : null;
    id = json['id'];
    name = json['name'];
    location = json['location'] ?? 'not provided by user';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    if (publicMetrics != null) {
      data['public_metrics'] = publicMetrics!.toJson();
    }
    data['id'] = id;
    data['name'] = name;
    data['location'] = location;
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
    followersCount = json['followers_count'];
    followingCount = json['following_count'];
    tweetCount = json['tweet_count'];
    listedCount = json['listed_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['followers_count'] = followersCount;
    data['following_count'] = followingCount;
    data['tweet_count'] = tweetCount;
    data['listed_count'] = listedCount;
    return data;
  }
}

class Meta {
  int? resultCount;
  String? nextToken;

  Meta({this.resultCount, this.nextToken});

  Meta.fromJson(Map<String, dynamic> json) {
    resultCount = json['result_count'];
    nextToken = json['next_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result_count'] = resultCount;
    data['next_token'] = nextToken;
    return data;
  }
}


// class LocationModel {
//    String? name;
//   late String username;
//   late String id;
//    String? location;

//   LocationModel(
//       { this.name = 'empty',
//       required this.username,
//       required this.id,
//        this.location = 'empty'});

//   LocationModel.fromJson(Map<String, dynamic> json)
//       : name = json['data']['name'] == null ? '' : '${json['data']['name']}' ,
//         username = '${json['data']['username']}',
//         id = '${json['data']['id']}',
//         location = json['data']['location'] == null ? '' : '${json['data']['location']}';
// }
