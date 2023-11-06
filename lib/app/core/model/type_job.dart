enum TypeJob{
  NONE,
  MEDIC,
  NON_MEDIC
}

extension TypeJobExt on TypeJob{
  String get value{
    switch(this){
      case TypeJob.MEDIC:
        return 'medic';
      case TypeJob.NON_MEDIC:
        return 'non-medic';
      case TypeJob.NONE:
        return '';
    }
  }

  String get name{
    switch(this){
      case TypeJob.MEDIC:
        return 'Medis';
      case TypeJob.NON_MEDIC:
        return 'Non Medis';
      case TypeJob.NONE:
        return '';
    }
  }
}