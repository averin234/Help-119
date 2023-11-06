import 'package:kreki119/app/data/model/form/form_complete_register.dart';

class FormUpgradeVolunteer extends FormCompleteRegister{
  FormUpgradeVolunteer({
      this.userVolunteerType, 
      this.heroCategory, 
      this.organizationName, 
      this.jobType, 
      this.yearWorkExperience, 
      this.workingCity, 
      this.description,});

  FormUpgradeVolunteer.fromJson(dynamic json) {
    fullName = json['full_name'];
    picture = json['picture'];
    birthdate = json['birthdate'];
    citizenId = json['citizen_id'];
    address = json['address'];
    gender = json['gender'];
    ktp = json['ktp'];
    certificate = json['certificate'];
    province = json['province'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    userVolunteerType = json['user_volunteer_type'];
    heroCategory = json['hero_category'];
    organizationName = json['organization_name'];
    jobType = json['job_type'];
    yearWorkExperience = json['year_work_experience'];
    workingCity = json['working_city'];
    description = json['description'];
  }
  String? userVolunteerType;
  String? heroCategory;
  String? organizationName;
  String? jobType;
  int? yearWorkExperience;
  String? workingCity;
  String? description;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = fullName;
    map['picture'] = picture;
    map['birthdate'] = birthdate;
    map['citizen_id'] = citizenId;
    map['address'] = address;
    map['gender'] = gender;
    map['ktp'] = ktp;
    map['certificate'] = certificate;
    map['province'] = province;
    map['city'] = city;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['user_volunteer_type'] = userVolunteerType;
    map['hero_category'] = heroCategory;
    map['organization_name'] = organizationName;
    map['job_type'] = jobType;
    map['year_work_experience'] = yearWorkExperience;
    map['working_city'] = workingCity;
    map['description'] = description;
    return map;
  }

}