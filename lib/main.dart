import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'components/aac_grid_view.dart';

import 'aac_button.dart';
import 'components/category_view.dart';
import 'components/image_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Box',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum TtsState { playing, stopped }

class _MyHomePageState extends State<MyHomePage> {
  int _categoryIndex = 0;
  Aac aac = Aac();
  FlutterTts flutterTts = FlutterTts();
  TtsState ttsState;
  int currentImageIndex = 0;

  void setCurrentImageIndex(index) {
    setState(() {
      currentImageIndex = index;
    });
  }

  Future _speak(phrase) async {
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);
    var result = await flutterTts.speak(phrase);
    if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  @override
  Widget build(BuildContext context) {
    //Aac aac = Aac();

    SystemChrome.setEnabledSystemUIOverlays([]);
    final pages = List<Widget>.generate(
      aac.categories.length,
      (i) {
        List myList = aac.buttonsInCategory(i);
        return Container(
          color: Colors.black,
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Flexible(
                flex: 180,
                fit: FlexFit.loose,
                child: ImageView(
                  myList: myList,
                  currentImageIndex: currentImageIndex,
                  speak: _speak,
                  categoryIndex: i,
                  aac: aac,
                ),
              ),
//              Flexible(
//                flex: 1,
//                child:Container(),
//              ),
              Flexible(
                flex: 80,
                fit: FlexFit.loose,
                child: AacGridView(
                  myList: myList,
                  aac: aac,
                  categoryIndex: i,
                  speak: _speak,
                  setCurrentImageIndex: setCurrentImageIndex,
                  currentImageIndex: currentImageIndex,
                ),
              ),
//              Flexible(
//                flex: 30,
//                child: CategoryView(
//                    aac: aac,
//                    setCategory: setCategory,
//                    setCurrentImageIndex: setCurrentImageIndex,
//                    categoryIndex: i),
//              ),
            ],
          ),
        );
      },
    );

    return Material(
      child: PageView(
        children: pages,
        onPageChanged: (num) {
          print("Current page number is " + num.toString());
        },
      ),
    );
  }

  setCategory(index) {
    setState(() {
      _categoryIndex = index;
    });
  }
}
