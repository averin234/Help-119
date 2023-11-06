enum TypeFcm {
  GENERAL,
  GET_EMERGENCY_CASE,
  TRIGGER_EMERGENCY,
  EMERGENCY_PICKED
}

extension TypeFcmExt on TypeFcm{
  String get value{
    switch(this){
      case TypeFcm.GENERAL:
        return 'general';
      case TypeFcm.GET_EMERGENCY_CASE:
        return 'get_emergency_case';
      case TypeFcm.TRIGGER_EMERGENCY:
        return 'trigger_emergency';
      case TypeFcm.EMERGENCY_PICKED:
        return 'emergency_picked';
    }
  }
}