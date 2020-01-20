import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AacGridView extends StatefulWidget {
  AacGridView({this.aac, this.speak, this.categoryIndex, this.currentImageIndex,  this.setCurrentImageIndex});
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
    List myList = widget.aac.buttonsInCategory(widget.categoryIndex);

    void _showDialog(index) {
      widget.speak(myList[index].displayName);

      Navigator.of(context).push(
        new MaterialPageRoute<Null>(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Center(
                  child: Stack(
                     children: [

                      Image.asset(
                        myList[index].symbolPath,
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
                              myList[index].displayName,
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

    return Container(
      height: MediaQuery.of(context).size.height, // - 100,
      color: Colors.black87,
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 6 / 6,
        children: List.generate(myList.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),

              //padding: const EdgeInsets.all(8.0),
              child: Stack(
//            onTap: () => widget.speak(myList[index].displayName),
                children: [
//                  Container(
//                    color: Colors.blue,
//                  ),
                  Container(
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.asset(
                        myList[index].symbolPath,
                        fit: BoxFit.cover,
                        //color: Colors.red,

                        //height: MediaQuery.of(context).size.height / 5,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color.fromRGBO(0, 0, 0, 0.0),
                              const Color.fromRGBO(0, 0, 0, 0.5)
                            ],
                            // tileMode: TileMode.repeated,
                          ),
                        ),
                        //color: Color.fromRGBO(0, 0, 0, 0.3),
                      )),
                  Positioned.fill(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: AutoSizeText(
                          myList[index].displayName,
                          style: GoogleFonts.didactGothic(
                            color: Colors.white,
                            textStyle: Theme.of(context).textTheme.body1,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(

                      onTap: () {

                          widget.setCurrentImageIndex(index);

                        _showDialog(index);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
