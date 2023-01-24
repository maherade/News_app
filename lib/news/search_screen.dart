import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/core/theme/api/api_manager.dart';
import 'package:news_app/core/theme/model/News.dart';
import 'package:news_app/news/news_item.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search-screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  List<News> newsList = [];

  @override
  Widget build(BuildContext context) {
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
              toolbarHeight: 70,
              elevation: 0.0,
              centerTitle: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              leading: const SizedBox(),
              leadingWidth: 10,
              title: Container(
                height: 60,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (String? value) {
                    setState(() {
                      query = value!;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    hintText: AppLocalizations.of(context)!.search,
                    contentPadding: const EdgeInsets.only(top: 10),
                    hintStyle: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    NewsItem(search().elementAt(index)),
                itemCount: search().length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List search() {
    ApiManager.getNews(query: query).then((newsResponse) {
      newsList = newsResponse.newsList ?? [];
    }).catchError((error) {
      debugPrint("error during calling api$error ");
    });
    return newsList;
  }
}
