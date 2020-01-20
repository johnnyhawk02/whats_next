import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:whats_next/aac_button.dart';

class CategoryView extends StatefulWidget {
  final Function setCategory;
  final int categoryIndex;
  final Aac aac;
  CategoryView({this.setCategory, this.categoryIndex, this.aac});

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int currentIndex;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
          //widget.setCategory(index);
        });
      },
      height: 75.0,
      viewportFraction: 0.35,
      enableInfiniteScroll: false,

      items:  List<int>.generate(widget.aac.categories.length, (i) => i ).map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color:
                        widget.categoryIndex == i ? Colors.red : Colors.amber),
                child: FlatButton(
                    onPressed: () => widget.setCategory(i),
                    child: Text(
                      '${widget.aac.categories[i].name}',
                      style: TextStyle(fontSize: 12.0),
                    )));
          },
        );
      }).toList(),
    );
  }
}
