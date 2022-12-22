class UserModel {
  String? mentorId;
  String? mentorUsername;
  String? mentorEmail;
  String? mentorFirstName;
  String? mentorLastName;
  String? mentorGender;
  String? mentorMobile;
  String? linkedinId;
  String? mentorDob;
  String? mentorQualification;
  String? mentorProgram;
  String? mentorTopic;
  String? mentorSecondarySkill;
  String? profilePic;
  String? currentCompany;
  String? jobTitle;
  String? domainExpertise;
  String? experience;
  String? about;
  UserModel(
      {this.mentorId,
      this.mentorUsername,
      this.mentorEmail,
      this.mentorFirstName,
      this.mentorLastName,
      this.mentorGender,
      this.mentorMobile,
      this.linkedinId,
      this.mentorDob,
      this.mentorQualification,
      this.mentorProgram,
      this.mentorTopic,
      this.mentorSecondarySkill,
      this.profilePic,
      this.currentCompany,
      this.jobTitle,
      this.domainExpertise,
      this.experience,
      this.about});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      mentorId: json['Mentor_Id'],
      mentorUsername: json['Mentor_Username']??"",
      mentorEmail: json["Email"]??"",
      mentorFirstName: json['First_Name']??"",
      mentorLastName: json['Last_Name']??"",
      mentorGender: json['Mentor_Gender']??"",
      mentorMobile: json["Mobile"]??"",
      linkedinId: json["LinkedIn"]??"",
      mentorDob: json['Mentor_dob'],
      mentorQualification: json['Mentor_Qualification']??"-",
      mentorProgram: json['Mentor_Program']??"-",
      mentorTopic: json['Mentor_Topic'],
      mentorSecondarySkill: json['Mentor_Secondary_Skill'],
      profilePic: json['profile_pic'],
      currentCompany: json['Comapany_Name']??"_",
      domainExpertise: json['domain_expertise']??"-",
      experience: json['work_experience']??"-",
      about: json['about_you']??"-",
      jobTitle: json['Job_Profile']??"-",
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'mentorId': mentorId,
      'Mentor_Username': mentorUsername,
      "Email": mentorEmail,
      'First_Name': mentorFirstName,
      'Last_Name': mentorLastName,
      'Mentor_Gender': mentorGender,
      "Mobile": mentorMobile,
      "LinkedIn": linkedinId,
      'Mentor_dob': mentorDob,
      'Mentor_Qualification': mentorQualification,
      'Mentor_Program': mentorProgram,
      'Mentor_Topic': mentorTopic,
      'Mentor_Secondary_Skill': mentorSecondarySkill,
      'profile_pic': profilePic,
      'Comapany_Name': currentCompany,
      'domain_expertise': domainExpertise,
      'work_experience': experience,
      'about_you': about,
      'Job_Profile': jobTitle,
    };
  }
}

//dropdown currentCompany

class CurrentCompanyModel {
  String? id;
  String? currentCompanyName;
  get name => "$currentCompanyName";
  CurrentCompanyModel({this.id, this.currentCompanyName});
  factory CurrentCompanyModel.fromJson(Map<String, dynamic> json) {
    return CurrentCompanyModel(
        id: json['id'], currentCompanyName: json['company_name']);
  }
 
}

//dropdown jobtitle
class JobttileModel {
  String? id;
  String? jobtitlename;
  get name => "$jobtitlename";
  JobttileModel({this.id, this.jobtitlename});
  factory JobttileModel.fromJson(Map<String, dynamic> json) {
    return JobttileModel(
        id: json['id'], jobtitlename: json['designation_name']);
  }
}

class ExperienceModel {
  String? id;
  String? experienceName;
  get name => "$experienceName";
  ExperienceModel({this.id, this.experienceName});
  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
        id: json['id'], experienceName: json['work_experience']);
  }
}

class DomainExpertiseModel {
  String? id;
  String? expertiseName;
  get name => "$expertiseName";
  DomainExpertiseModel({this.id, this.expertiseName});
  factory DomainExpertiseModel.fromJson(Map<String, dynamic> json) {
    return DomainExpertiseModel(
        id: json['id'], expertiseName: json['domain_name']);
  }
}

class SkillsetModel {
  String? id;
  String? skillName;
  get name => "$skillName";
  SkillsetModel({this.id, this.skillName});
  factory SkillsetModel.fromJson(Map<String, dynamic> json) {
    return SkillsetModel(id: json['id'], skillName: json['name']);
  }
}
