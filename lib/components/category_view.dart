import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:whats_next/aac_button.dart';

class CategoryView extends StatefulWidget {
  final Function setCategory;
  final Function setCurrentImageIndex;
  final int categoryIndex;
  final Aac aac;
  CategoryView(
      {this.setCategory,
      this.categoryIndex,
      this.aac,
      this.setCurrentImageIndex});

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        '${widget.aac.categories[widget.categoryIndex].name}',
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );
  }
}
