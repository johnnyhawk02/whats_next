import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ImageView extends StatefulWidget {
  final currentImageIndex;

  final categoryIndex;

  final aac;
  final speak;
  final myList;
  ImageView({
    this.currentImageIndex,
    this.categoryIndex,
    this.aac,
    this.speak,
    this.myList,
  });
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  //var currentImageIndex=0;
  @override
  Widget build(BuildContext context) {
    List myList = widget.aac.buttonsInCategory(widget.categoryIndex);

    return GestureDetector(
      onTap: () {
        widget.speak(widget.myList[widget.currentImageIndex >= widget.myList.length
            ? 0
            : widget.currentImageIndex].displayName);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),

        child: Container(
          height: MediaQuery.of(context).size.height - 250,
          width: MediaQuery.of(context).size.width ,
          child: Image.asset(
            widget
                .myList[widget.currentImageIndex >= widget.myList.length
                    ? 0
                    : widget.currentImageIndex]
                .symbolPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
