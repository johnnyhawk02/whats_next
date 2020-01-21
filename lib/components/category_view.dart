import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:whats_next/aac_button.dart';

class CategoryView extends StatefulWidget {
  final Function setCategory;
  final Function setCurrentImageIndex;
  final int categoryIndex;
  final Aac aac;
  CategoryView({this.setCategory, this.categoryIndex, this.aac, this.setCurrentImageIndex});

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
          widget.setCategory(index);
          widget.setCurrentImageIndex(0);
        });
      },
      height: 100.0,
      viewportFraction: 0.33,
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

                       //color: Colors.black
                       ),
              child: FlatButton(
                onPressed: () => widget.setCategory(i),
                child: Text(

                  '${widget.aac.categories[i].name}',
                  style: TextStyle(fontSize: 17.0,color: widget.categoryIndex == i?Colors.white:Colors.grey[700]),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
