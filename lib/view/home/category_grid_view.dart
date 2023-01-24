import 'package:flutter/material.dart';

class CategoryGridView extends StatefulWidget {
  Category category;
  int index;
  Function onClickItem;

  CategoryGridView({
    required this.category,
    required this.index,
    required this.onClickItem,
  });

  @override
  State<CategoryGridView> createState() => _CategoryGridViewState();
}

class _CategoryGridViewState extends State<CategoryGridView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onClickItem(widget.category);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.category.categoryBackground,
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(20),
            topLeft: const Radius.circular(20),
            bottomRight: Radius.circular(widget.index % 2 == 0 ? 0 : 20),
            bottomLeft: Radius.circular(widget.index % 2 == 0 ? 20 : 0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.category.categoryImage),
            Text(
              widget.category.categoryTitle,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  String categoryID;
  String categoryImage;
  late String categoryTitle;
  Color categoryBackground;

  Category({
    required this.categoryID,
    required this.categoryImage,
    required this.categoryTitle,
    required this.categoryBackground,
  });
}
