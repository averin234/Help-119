enum EmergencyStatus{
  WAITING,
  ACCEPTED,
  REJECTED,
  ON_GOING,
  FINISHED,
  CANCELED,
  SCAM,
  NEED_FOLLOW_UP
}

extension EmergencyStatusExt on EmergencyStatus{
  String get description{
    switch(this){
      case EmergencyStatus.WAITING:
        return 'waiting';
      case EmergencyStatus.ACCEPTED:
        return 'accepted';
      case EmergencyStatus.REJECTED:
        return 'rejected';
      case EmergencyStatus.ON_GOING:
        return 'on_going';
      case EmergencyStatus.FINISHED:
        return 'finished';
      case EmergencyStatus.CANCELED:
        return 'canceled';
      case EmergencyStatus.SCAM:
        return 'scam';
      case EmergencyStatus.NEED_FOLLOW_UP:
        return 'need_follow_up';
    }
  }
}