class StringStructure {
  String text;
  int numberChapter;
  StringStructure(this.text, this.numberChapter);
  getText() => this.text;
  getNumberChapter() => this.numberChapter;
}


List<StringStructure> replaceStr(String str) {
  List<StringStructure> returned = [];
  RegExp exp = new RegExp('[0-9]{1,3}');
  String str2;
  String temp;
  for (int i = 0;; i++) {
    if (exp.hasMatch(str) == true) {
      str2 = exp.stringMatch(str);
      if (i == 0) {
        temp = str.split(str2)[0];
        returned.add(StringStructure(temp, int.parse(str2)));
        temp = str.split(str2)[1];
        returned.add(StringStructure(temp, 0));
        str = temp;// = str.split(str2)[1];
      } else {
        temp = str.split(str2)[0];
        returned[i] = StringStructure(temp, int.parse(str2));
        temp = str.split(str2)[1];
        returned.add(StringStructure(temp, 0));
        str = temp;
      }
    } else {
      return returned;
    }
  }
}

