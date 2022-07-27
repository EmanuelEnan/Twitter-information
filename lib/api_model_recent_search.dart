class ApiModelRecentSearch {
  List<Data>? data;
  Includes? includes;
  Meta? meta;

  ApiModelRecentSearch({this.data, this.includes, this.meta});

  ApiModelRecentSearch.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    includes = json['includes'] != null
        ? Includes.fromJson(json['includes'])
        : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (includes != null) {
      data['includes'] = includes!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? text;
  String? createdAt;
  String? replySettings;
  String? conversationId;
  bool? possiblySensitive;
  String? authorId;

  Data(
      {this.id,
      this.text,
      this.createdAt,
      this.replySettings,
      this.conversationId,
      this.possiblySensitive,
      this.authorId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    createdAt = json['created_at'];
    replySettings = json['reply_settings'];
    conversationId = json['conversation_id'];
    possiblySensitive = json['possibly_sensitive'];
    authorId = json['author_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['created_at'] = createdAt;
    data['reply_settings'] = replySettings;
    data['conversation_id'] = conversationId;
    data['possibly_sensitive'] = possiblySensitive;
    data['author_id'] = authorId;
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

class Meta {
  String? newestId;
  String? oldestId;
  int? resultCount;
  String? nextToken;

  Meta({this.newestId, this.oldestId, this.resultCount, this.nextToken});

  Meta.fromJson(Map<String, dynamic> json) {
    newestId = json['newest_id'];
    oldestId = json['oldest_id'];
    resultCount = json['result_count'];
    nextToken = json['next_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['newest_id'] = newestId;
    data['oldest_id'] = oldestId;
    data['result_count'] = resultCount;
    data['next_token'] = nextToken;
    return data;
  }
}
