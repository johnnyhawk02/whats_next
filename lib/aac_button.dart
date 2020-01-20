import 'symbol_paths.dart';
import 'default_category_data.dart' show defaultCategoryData;
import 'default_button_data.dart' show defaultButtonData;

List<Category> _categories = [];
List<AacButton> _buttons = [];

class Category {
  int index;
  String name;

  Category(this.index, this.name) {}
}

class AacButton {
  String speechText;
  String displayName;
  String symbolName;
  int categoryIndex;
  String symbolPath;

  AacButton(
      this.categoryIndex, this.symbolName, this.displayName, this.speechText) {
    this.displayName = this.displayName.replaceAll('_', ' ');
    this.symbolPath = 'assets/images/$symbolName.jpg'; //get symbol path
  }

  String get categoryName {
    return _categories[this.categoryIndex].name;
  }
}

class Aac {
  Aac() {
    _buttons = [];
    _categories = [];
    defaultButtonData.forEach((element) {
      _buttons.add(AacButton(
        element['categoryIndex'],
        element['symbolName'],
        tidyUp(element['symbolName']),
        element['symbolName'],
      ));
    });

    defaultCategoryData.forEach((element) {
      _categories.add(Category(
        element['index'],
        element['name'],
      ));
    });
  }

  List<Category> get categories {
    return _categories;
  }

  List<AacButton> buttonsInCategory(categoryIndex) {
    return _buttons.where((i) => i.categoryIndex == categoryIndex).toList();
  }

  void addButton({categoryIndex, symbolName, displayName, speechText}) {
    _buttons.add(AacButton(categoryIndex, symbolName, displayName, speechText));
  }

  String tidyUp(String s) {
    String tmp = '';
    if (s.contains(',')) {
      tmp = s.split(',')[1] + ' ' + s.split(',')[0];
      s=tmp.trimLeft();//.ltr
    }
    return s;
  }
}
