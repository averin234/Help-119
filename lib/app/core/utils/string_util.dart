extension StringUtil on String{

  String toFirstLetterUpperCase(){
    var firstLetter = substring(0, 1).toUpperCase();
    var rest = substring(1, length).toLowerCase();

    return '$firstLetter$rest';
  }
}