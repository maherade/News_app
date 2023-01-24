import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/theme/model/News.dart';
import 'package:news_app/news/news_details.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem(this.news);

  @override
  Widget build(BuildContext context) {
    var publishedAt = DateTime.parse(news.publishedAt ?? "");

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetails.routeName, arguments: news);
      },
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              width: double.infinity,
              height: 200,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                size: 30,
              ),
            ),
          ),
          Text(
            news.author ?? '',
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            news.title ?? '',
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "${showPublishedAtDate(publishedAt, news)}",
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: Color.fromRGBO(163, 163, 163, 1.0),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      )),
    );
  }

  showPublishedAtDate(DateTime publishedAt, News news) {
    var dateTimeNews = DateTime.now();
    var difference = dateTimeNews
        .difference(DateTime.parse(news.publishedAt ?? ''))
        .inMinutes;

    if (difference < 0) {
      difference = dateTimeNews
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inSeconds;
      return '$difference seconds ago';
    } else if (difference > 0 && difference < 60) {
      difference = dateTimeNews
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inMinutes;
      return '$difference Minutes ago';
    } else if (difference > 60 && difference < 1440) {
      difference = dateTimeNews
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inHours;
      return '$difference Hours ago';
    } else if (difference > 1440 && difference < 44640) {
      difference = dateTimeNews
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inDays;
      return '$difference Days ago';
    } else {
      return DateFormat.yMMMd().format(DateTime.parse(news.publishedAt ?? ''));
    }
  }
}
