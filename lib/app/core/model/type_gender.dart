enum TypeGender{
  NONE,
  MAN,
  WOMAN
}

extension TypeGenderExt on TypeGender{
  String get valueOutput{
    switch(this){
      case TypeGender.MAN:
        return 'l';
      case TypeGender.WOMAN:
        return 'p';
      case TypeGender.NONE:
        return '';
      default:
        return '';
    }
  }
  String get description{
    switch(this){
      case TypeGender.NONE:
        return '';
      case TypeGender.MAN:
        return 'Laki-laki';
      case TypeGender.WOMAN:
        return 'Perempuan';
    }
  }
}
