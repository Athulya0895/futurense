class UserModel {
  String? mentorId;
  String? mentorUsername;
  String? mentorEmail;
  String? mentorName;
  String? mentorGender;
  String? mentorMobile;
  String? mentorDob;
  String? mentorQualification;
  String? mentorProgram;
  String? mentorTopic;
  String? mentorSecondarySkill;
  UserModel(
      {this.mentorId,
      this.mentorUsername,
      this.mentorEmail,
      this.mentorName,
      this.mentorGender,
      this.mentorMobile,
      this.mentorDob,
      this.mentorQualification,
      this.mentorProgram,
      this.mentorTopic,
      this.mentorSecondarySkill});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        mentorId: json['Mentor_Id'],
        mentorUsername: json['Mentor_Username'],
        mentorEmail: json['Mentor_Email'],
        mentorName: json['Mentor_Name'],
        mentorGender: json['Mentor_Gender'],
        mentorMobile: json['Mentor_Mobile'],
        mentorDob: json['Mentor_dob'],
        mentorQualification: json['Mentor_Qualification'],
        mentorProgram: json['Mentor_Program'],
        mentorTopic: json['Mentor_Topic'],
        mentorSecondarySkill: json['Mentor_Secondary_Skill']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'mentorId': mentorId,
      'Mentor_Username': mentorUsername,
      'Mentor_Email': mentorEmail,
      'Mentor_Name': mentorName,
      'Mentor_Gender': mentorGender,
      'Mentor_Mobile': mentorMobile,
      'Mentor_dob': mentorDob,
      'Mentor_Qualification': mentorQualification,
      'Mentor_Program': mentorProgram,
      'Mentor_Topic': mentorTopic,
      'Mentor_Secondary_Skill': mentorSecondarySkill
    };
  }
}
