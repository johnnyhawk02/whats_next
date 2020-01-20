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
    return Column(
      children: <Widget>[
        Text(
          '${widget.aac.categories[currentIndex].name}',
          style: TextStyle(fontSize: 26.0),
        ),
        CarouselSlider(
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
              widget.setCategory(index);
            });
          },
          height: 100.0,
          viewportFraction: 0.25,
          enableInfiniteScroll: false,
          items:
              List<int>.generate(widget.aac.categories.length, (i) => i).map((i) {
            return Builder(
              builder: (BuildContext context) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: widget.categoryIndex == i
                          ? Colors.lightGreenAccent
                          : Colors.green),
                  child: FlatButton(
                    onPressed: () => widget.setCategory(i),
                    child: Text(
                      '$i' , //'''${widget.aac.categories[i].name}',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
