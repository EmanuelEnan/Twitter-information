class ApiModelPinnedTweet {
  Data? data;
  Includes? includes;

  ApiModelPinnedTweet({this.data, this.includes});

  ApiModelPinnedTweet.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    includes = json['includes'] != null
        ? Includes.fromJson(json['includes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (includes != null) {
      data['includes'] = includes!.toJson();
    }
    return data;
  }
}

class Data {
  String? source;
  String? id;
  String? replySettings;
  String? lang;
  String? conversationId;
  String? authorId;
  bool? possiblySensitive;
  String? text;
  String? createdAt;
  PublicMetrics? publicMetrics;

  Data(
      {this.source,
      this.id,
      this.replySettings,
      this.lang,
      this.conversationId,
      this.authorId,
      this.possiblySensitive,
      this.text,
      this.createdAt,
      this.publicMetrics});

  Data.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    id = json['id'];
    replySettings = json['reply_settings'];
    lang = json['lang'];
    conversationId = json['conversation_id'];
    authorId = json['author_id'];
    possiblySensitive = json['possibly_sensitive'];
    text = json['text'];
    createdAt = json['created_at'];
    publicMetrics = json['public_metrics'] != null
        ? PublicMetrics.fromJson(json['public_metrics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source'] = source;
    data['id'] = id;
    data['reply_settings'] = replySettings;
    data['lang'] = lang;
    data['conversation_id'] = conversationId;
    data['author_id'] = authorId;
    data['possibly_sensitive'] = possiblySensitive;
    data['text'] = text;
    data['created_at'] = createdAt;
    if (publicMetrics != null) {
      data['public_metrics'] = publicMetrics!.toJson();
    }
    return data;
  }
}

class PublicMetrics {
  int? retweetCount;
  int? replyCount;
  int? likeCount;
  int? quoteCount;

  PublicMetrics(
      {this.retweetCount, this.replyCount, this.likeCount, this.quoteCount});

  PublicMetrics.fromJson(Map<String, dynamic> json) {
    retweetCount = json['retweet_count'];
    replyCount = json['reply_count'];
    likeCount = json['like_count'];
    quoteCount = json['quote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['retweet_count'] = retweetCount;
    data['reply_count'] = replyCount;
    data['like_count'] = likeCount;
    data['quote_count'] = quoteCount;
    return data;
  }
}

class Includes {
  List<Users>? users;

  Includes({this.users});

  Includes.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String? id;
  String? name;
  String? username;

  Users({this.id, this.name, this.username});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    return data;
  }
}
