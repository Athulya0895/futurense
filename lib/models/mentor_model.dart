class MentorModel {
  String? profilePic;
  String? id;
  String? fName;
  String? lName;
  String? studentsMentored;
  String? designationName;
  String? workExperience;
  String? canHelpYou;
  String? aboutYou;
  String? skills;
  String? rating;
  String? reviews;
  String? availability;
  String? email;
  String? channelName;
  String? phoneNumber;
  String? domainExpertise; //reschedule

  // List<String>? communication;
  MentorModel(
      {this.profilePic,
      this.id,
      this.fName,
      this.lName,
      this.studentsMentored,
      this.designationName,
      this.workExperience,
      this.canHelpYou,
      this.aboutYou,
      this.skills,
      this.rating,
      this.reviews,
      this.availability,
      this.email,
      this.phoneNumber,
      this.domainExpertise

      // this.communication
      });
  factory MentorModel.fromjson(Map<String, dynamic> json) {
    return MentorModel(
      profilePic: json['profile_pic'] ?? "",
      id: json['id'],
      fName: json['f_name'],
      lName: json['l_name'],
      studentsMentored: json['students_mentored'] ?? "-",
      designationName: json['designation_name'] ?? "-",
      workExperience: json['work_experience'] ?? "-",
      canHelpYou: json['can_help_you'] ?? "-",
      aboutYou: json['about_you'] ?? "-",
      skills: json['skills'] ?? "-",
      rating: json['rating'] ?? "-",
      reviews: json['reviews'] ?? "-",
      availability: json['availability'],
      email: json['email'] ?? "-",
      phoneNumber: json['phone'] ?? "-",
      domainExpertise: json['domain_expertise'] ?? "-",
      // communication: json['communication'],
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'profile_pic': profilePic,
      'id': id,
      'f_name': fName,
      'l_name': lName,
      'students_mentored': studentsMentored,
      'designation_name': designationName,
      'work_experience': workExperience,
      'can_help_you': canHelpYou,
      'about_you': aboutYou,
      'skills': skills,
      'rating': rating,
      'reviews': reviews,
      'availability': availability,
      // 'communication': communication,
      'email': email,
      'phone': phoneNumber,
      'domain_expertise': domainExpertise
    };
  }
}

class MeetingModel {
  String? userName;
  String? communicationMode;
  String? fromDate;
  String? startTime;
  String? duration;
  String? meetingAgenda;
  String? channelName;
  String? agoraToken;
  String? profilepic;
  String? userId;
  String? cancelReason;
  String? email;
  String? designtionName;
  String? workExperience;
  String? canhelp;
  String? about;
  String? skills;
  String? ratings;
  String? reviews;
  String? status;
  bool? canJoin;

  MeetingModel(
      {this.userName,
      this.communicationMode,
      this.fromDate,
      this.startTime,
      this.duration,
      this.meetingAgenda,
      this.channelName,
      this.agoraToken,
      this.profilepic,
      this.userId,
      this.cancelReason,
      this.email,
      this.designtionName,
      this.canhelp,
      this.about,
      this.workExperience,
      this.ratings,
      this.reviews,
      this.skills,
      this.status,
      this.canJoin});
  factory MeetingModel.fromjson(Map<String, dynamic> json) {
    return MeetingModel(
        userName: json['user_name'] ?? "",
        communicationMode: json['communication_mode'],
        fromDate: json['from_date'],
        startTime: json['start_time'],
        duration: json['duration'],
        meetingAgenda: json['meeting_agenda'] ?? "_",
        channelName: json['channel_name'],
        agoraToken: json['agora_token'],
        profilepic: json['profile_pic'],
        userId: json['user_id'] ?? "",
        cancelReason: json['cancel_reason'] ?? "",
        about: json['about_you'] ?? "-",
        canhelp: json['can_help_you'] ?? "-",
        designtionName: json['designation_name'] ?? "-",
        email: json['email'] ?? "-",
        ratings: json['rating'] ?? "-",
        reviews: json['review'] ?? "-",
        skills: json['skills'] ?? "-",
        workExperience: json['work_experience'] ?? "-",
        status: json['meeting_status'],
        canJoin: json['can_join']);
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_name': userName,
      'communication_mode': communicationMode,
      'from_date': fromDate,
      'start_time': startTime,
      'duration': duration,
      'meeting_agenda': meetingAgenda,
      'channel_name': channelName,
      'profile_pic': profilepic,
      'user_id': userId,
      'cancel_reason': cancelReason,
      'about_you': about,
      'can_help_you': canhelp,
      'designation_name': designtionName,
      'email': email,
      'rating': ratings,
      'review': reviews,
      'skills': skills,
      'work_experience': workExperience,
      'meeting_status': status,
      'can_join': canJoin,
    };
  }
}
