import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/category/category_widget.dart';
import 'package:news_app/news/search_screen.dart';
import 'package:news_app/settings_tab/settings.dart';
import 'package:news_app/view/home/category_grid_view.dart';

class HomeView extends StatefulWidget {
  static const String routeName = 'home-view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    List<Category> category = [
      Category(
          categoryID: 'Sports',
          categoryImage: 'assets/images/sports.png',
          categoryTitle: AppLocalizations.of(context)!.sports,
          categoryBackground: const Color.fromRGBO(201, 28, 34, 1.0)),
      Category(
          categoryID: "General",
          categoryImage: 'assets/images/politics.png',
          categoryTitle: AppLocalizations.of(context)!.politics,
          categoryBackground: const Color.fromRGBO(0, 62, 144, 1.0)),
      Category(
          categoryID: 'Health',
          categoryImage: 'assets/images/health.png',
          categoryTitle: AppLocalizations.of(context)!.health,
          categoryBackground: const Color.fromRGBO(237, 30, 121, 1.0)),
      Category(
          categoryID: 'Business',
          categoryImage: 'assets/images/bussines.png',
          categoryTitle: AppLocalizations.of(context)!.business,
          categoryBackground: const Color.fromRGBO(207, 126, 72, 1.0)),
      Category(
          categoryID: 'Technology',
          categoryImage: 'assets/images/technology.png',
          categoryTitle: AppLocalizations.of(context)!.technology,
          categoryBackground: const Color.fromRGBO(72, 130, 207, 1.0)),
      Category(
          categoryID: 'Science',
          categoryImage: 'assets/images/science.png',
          categoryTitle: AppLocalizations.of(context)!.science,
          categoryBackground: const Color.fromRGBO(242, 211, 82, 1.0)),
    ];
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
              elevation: 0.0,
              centerTitle: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              actions: [
                selectedCategory != null
                    ? InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, SearchScreen.routeName);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Icon(
                            Icons.search,
                            size: 30,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
              title: Text(
                selectedCategory == null
                    ? AppLocalizations.of(context)!.title
                    : selectedCategory!.categoryTitle,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 45),
                    color: Colors.green,
                    width: double.infinity,
                    height: 120,
                    child: Text(AppLocalizations.of(context)!.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedCategory = null;
                          Navigator.pop(context);
                        });
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.menu,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.categories,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, SettingsTab.routeName);
                        });
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.settings,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.settings,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: selectedCategory == null
                ? Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!
                              .pickYourCategoryOfInterest,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 6 / 7,
                            ),
                            itemBuilder: (context, index) => CategoryGridView(
                              category: category[index],
                              index: index,
                              onClickItem: onClick,
                            ),
                            itemCount: category.length,
                          ),
                        ),
                      ],
                    ),
                  )
                : CategoryNewsList(selectedCategory!),
          ),
        ],
      ),
    );
  }

  Category? selectedCategory;

  void onClick(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
