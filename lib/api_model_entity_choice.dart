class ApiModelEntityChoice {
  List<Data>? data;
  Meta? meta;

  ApiModelEntityChoice({this.data, this.meta});

  ApiModelEntityChoice.fromJson(Map<String, dynamic> json) {
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
  List<ContextAnnotations>? contextAnnotations;
  String? id;
  String? text;

  Data({this.contextAnnotations, this.id, this.text});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['context_annotations'] != null) {
      contextAnnotations = <ContextAnnotations>[];
      json['context_annotations'].forEach((v) {
        contextAnnotations!.add(ContextAnnotations.fromJson(v));
      });
    }
    id = json['id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (contextAnnotations != null) {
      data['context_annotations'] =
          contextAnnotations!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['text'] = text;
    return data;
  }
}

class ContextAnnotations {
  Domain? domain;
  Domain? entity;

  ContextAnnotations({this.domain, this.entity});

  ContextAnnotations.fromJson(Map<String, dynamic> json) {
    domain =
        json['domain'] != null ? Domain.fromJson(json['domain']) : null;
    entity =
        json['entity'] != null ? Domain.fromJson(json['entity']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (domain != null) {
      data['domain'] = domain!.toJson();
    }
    if (entity != null) {
      data['entity'] = entity!.toJson();
    }
    return data;
  }
}

class Domain {
  String? id;
  String? name;
  String? description;

  Domain({this.id, this.name, this.description});

  Domain.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
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
