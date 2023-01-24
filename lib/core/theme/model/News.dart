import 'package:news_app/core/theme/model/Source.dart';

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : null
/// title : "'We are duty-bound to protect the lives of the British people' - Grant Shapps"
/// description : "Grant Shapps tells the House of Commons the government is \"duty-bound to protect the lives and the livelihoods of the British people\"."
/// url : "https://www.bbc.co.uk/news/av/uk-politics-64224179"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/branded_news/13F33/production/_128251718_p0dvchtk.jpg"
/// publishedAt : "2023-01-10T13:54:19Z"
/// content : "Business Secretary Grant Shapps has been telling the House of Commons the government is \"duty-bound to protect the lives and the livelihoods of the British people\".\r\nThe government is putting forward… [+138 chars]"

class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
