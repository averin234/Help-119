enum TypeData{
  AUDIO,
  VIDEO,
  WEB,
  URL,
}

extension TypeDataExt on TypeData{
  String get value{
    switch(this){
      case TypeData.AUDIO:
        return 'mp3';
      case TypeData.VIDEO:
        return 'mp4';
      case TypeData.WEB:
        return 'html';
      case TypeData.URL:
        return 'https';
    }
  }
}