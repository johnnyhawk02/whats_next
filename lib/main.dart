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

    return Material(
      child: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(

            children: <Widget>[
              ImageView(
                currentImageIndex: currentImageIndex,
                categoryIndex: _categoryIndex,
                aac: aac,
              ),
              AacGridView(
                aac: aac,
                categoryIndex: _categoryIndex,
                speak: _speak,
                setCurrentImageIndex: setCurrentImageIndex,
              ),
//              CategoryView(
//                  aac: aac,
//                  setCategory: setCategory,
//                  categoryIndex: _categoryIndex),
            ],
          ),
        ),
      ),
    );
  }

  setCategory(index) {
    setState(() {
      _categoryIndex = index;
    });
  }
}
