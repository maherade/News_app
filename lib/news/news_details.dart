import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/theme/model/News.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'news-details';

  @override
  Widget build(BuildContext context) {
    News news = ModalRoute.of(context)?.settings.arguments as News;
    var publishedAt = DateTime.parse(news.publishedAt ?? "");

    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Image.asset(
              'assets/images/pattern.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Scaffold(
            appBar: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              elevation: 0.0,
              centerTitle: true,
              title: Text('News Details'),
            ),
            body: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
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
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    news.author ?? '',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Color.fromRGBO(121, 130, 139, 1.0),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    news.title ?? '',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
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
                  Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 0.5,
                            offset: const Offset(1, 2),
                          )
                        ]),
                    child: Column(
                      children: [
                        Text(news.description ?? ""),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            _launchUrl(Uri.parse(news.url ?? ""));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  'View Full Article',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color.fromRGBO(66, 80, 92, 1.0),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: Color.fromRGBO(66, 80, 92, 1.0),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
