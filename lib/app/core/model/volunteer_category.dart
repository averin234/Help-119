enum VolunteerCategory {
  PERSONAL,
  PSC,
  INSTITUTION
}

extension VolunteerCategoryExt on VolunteerCategory{
  String get value {
    switch (this) {
      case VolunteerCategory.PERSONAL:
        return 'personal';
      case VolunteerCategory.PSC:
        return 'psc';
      case VolunteerCategory.INSTITUTION:
        return 'institution';
    }
  }

  String get name {
    switch (this) {
      case VolunteerCategory.PERSONAL:
        return 'personal';
      case VolunteerCategory.PSC:
        return 'psc';
      case VolunteerCategory.INSTITUTION:
        return 'institution';
    }
  }
}