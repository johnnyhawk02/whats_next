import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final currentImageIndex;

  final categoryIndex;

  final aac;

  ImageView({this.currentImageIndex, this.categoryIndex, this.aac});
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    List myList = widget.aac.buttonsInCategory(widget.categoryIndex);

    return Container(
      height: MediaQuery.of(context).size.height -250 ,
      //color: Colors.black,
      child:
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),

          child: Image.asset(
            myList[widget.currentImageIndex].symbolPath,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
