enum TypeLocation{
  Province,
  City
}

extension TypeLocationExtension on TypeLocation {

  int get value{
    switch(this){
      case TypeLocation.Province:
        return 1;
      case TypeLocation.City:
        return 2;
    }
  }
}