import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AacGridView extends StatefulWidget {
  AacGridView(
      {this.aac,
      this.speak,
      this.categoryIndex,
      this.currentImageIndex,
      this.setCurrentImageIndex,
      this.myList});
  final myList;

  final aac;
  final speak;
  final categoryIndex;
  final currentImageIndex;
  final Function setCurrentImageIndex;
  @override
  _AacGridViewState createState() => _AacGridViewState();
}

class _AacGridViewState extends State<AacGridView> {
  @override
  Widget build(BuildContext context) {
    //List myList = widget.aac.buttonsInCategory(widget.categoryIndex);

    void _showDialog(index) {
      widget.speak(widget.myList[index].displayName);

      Navigator.of(context).push(
        new MaterialPageRoute<Null>(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Center(
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.myList[index].symbolPath,
                        //fit: BoxFit.fitHeight,
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color.fromRGBO(0, 0, 0, 0.99),
                                  const Color.fromRGBO(0, 0, 0, 0.0)
                                ],
                                // tileMode: TileMode.repeated,
                              ),
                            ),
                            //color: Color.fromRGBO(0, 0, 0, 0.3),
                          )),
                      Positioned.fill(
                        top: 0,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: AutoSizeText(
                              widget.myList[index].displayName,
                              style: GoogleFonts.didactGothic(
                                color: Colors.white,
                                textStyle: Theme.of(context).textTheme.body1,
                                fontSize: 36,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            fullscreenDialog: true),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        //height: MediaQuery.of(context).size.height-200, // - 100,
        color: Colors.black,
        child: GridView.count(
          // scrollDirection: Axis.horizontal,
          crossAxisCount: 1,
          childAspectRatio: 8/ 1,
          children: List.generate(widget.myList.length, (index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 4000),
                child: FlatButton(
                  color: index==widget.currentImageIndex?Colors.grey[700]:Colors.grey[900],
                  onLongPress: () {
                    setState(() {
                      widget.speak(widget.myList[index].displayName);
                      widget.setCurrentImageIndex(index);
                    });

                  },
                  child: new Text(
                    widget.myList[index].displayName,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
