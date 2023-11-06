enum TypeVolunteer{
  VOLUNTEER,
  AMBULANCE,
  HOSPITAL,
  PSC
}

extension TypeVolunnteerExt on TypeVolunteer{
  String get value {
    switch (this) {
      case TypeVolunteer.VOLUNTEER:
        return 'volunteer';
      case TypeVolunteer.AMBULANCE:
        return 'ambulance';
      case TypeVolunteer.HOSPITAL:
        return 'hospital';
      case TypeVolunteer.PSC:
        return 'psc';
    }
  }
  String get name {
    switch (this) {
      case TypeVolunteer.VOLUNTEER:
        return 'volunteer';
      case TypeVolunteer.AMBULANCE:
        return 'ambulance';
      case TypeVolunteer.HOSPITAL:
        return 'hospital';
      case TypeVolunteer.PSC:
        return 'psc';
    }
  }
}