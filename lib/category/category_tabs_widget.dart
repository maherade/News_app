import 'package:flutter/material.dart';
import 'package:news_app/category/source_tab_item.dart';
import 'package:news_app/core/theme/model/Source.dart';
import 'package:news_app/news/news_list.dart';

class CategoryTabsWidget extends StatefulWidget {
  List<Source> sources;

  CategoryTabsWidget(this.sources);

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.sources
                    .map(
                      (source) => SourceTab(source,
                          widget.sources.indexOf(source) == selectedIndex),
                    )
                    .toList()),
            Expanded(child: NewsList(widget.sources[selectedIndex])),
          ],
        ),
      ),
    );
  }
}
