enum VolunteerStatus{
  WAITING,
  ACCEPTED,
  REJECTED,
  DEACTIVATED
}

extension VolunteerStatusExt on VolunteerStatus{
  String get name{
    switch(this){
      case VolunteerStatus.WAITING:
        return 'waiting';
      case VolunteerStatus.ACCEPTED:
        return 'accepted';
      case VolunteerStatus.REJECTED:
        return 'rejected';
      case VolunteerStatus.DEACTIVATED:
        return 'deactivated';
    }
  }
}