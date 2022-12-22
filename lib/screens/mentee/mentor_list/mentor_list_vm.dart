import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/filter_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/models/user_model.dart';

class MentorListVM extends BaseViewModel {
  @override
  void onInit() {
    getTopMentees();
    getExperience();
    getJobtitle();
    getDomainExpertise();
    getSkillSet();
  }

//get Top MentorList
  List tempmentorList = [];
  List<MentorModel> topMentorList = [];
  void getTopMentees() async {
    showLoading();
    final res = await api.menteeRepo.getTopMentors();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        print("------");
        tempmentorList = res.data['DATA'] as List;
        topMentorList =
            tempmentorList.map((e) => MentorModel.fromjson(e)).toList();
        print(topMentorList);
        print("+++++++++");
        notifyListeners();
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("servere Error");
    }
  }

  final formKey = GlobalKey<FormState>();
  ExperienceModel? selectedExperience;

  JobttileModel? selectedJob;
  DomainExpertiseModel? selectedDomain;
  SkillsetModel? selectedskillset;
//experience list
  List<ExperienceModel> experiencesList = [];
  void getExperience() async {
    showLoading();
    final res = await api.mentorRepo.getExperience();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        print("true status");
        List tempexperienceList = res.data['DATA'] as List;
        experiencesList =
            tempexperienceList.map((e) => ExperienceModel.fromJson(e)).toList();
        // selectedExperience = experiencesList
        //     .firstWhere((element) => element.name == prefs.user!.experience);
        // print("firstWhere");
        // print(selectedCompany);
      } else {
        showError(res.data['message'] ?? "No data from backend");
      }
    } else {
      showError("Server Error");
    }
    notifyListeners();
  }

  List<JobttileModel> jobtitleList = [];
  void getJobtitle() async {
    showLoading();
    final res = await api.mentorRepo.getJobtitle();
    print(res);
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        List tempjobtitleList = res.data['Data'] as List;
        jobtitleList =
            tempjobtitleList.map((e) => JobttileModel.fromJson(e)).toList();
        // selectedJob = jobtitleList
        //     .firstWhere((element) => element.name == prefs.user!.jobTitle);
        print("firstWhere");
        // print(selectedCompany);
      } else {
        showError(res.data['message'] ?? "No data from backend");
      }
    } else {
      showError("Server Error");
    }
    notifyListeners();
  }

  //domain expertise
  List<DomainExpertiseModel> domainExpertiseList = [];
  void getDomainExpertise() async {
    showLoading();
    final res = await api.mentorRepo.getDomainExpertise();
    print(res);
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        List tempdomainExpertiseList = res.data['Data'] as List;
        domainExpertiseList = tempdomainExpertiseList
            .map((e) => DomainExpertiseModel.fromJson(e))
            .toList();
        // selectedJob = domainExpertiseList
        //     .firstWhere((element) => element.name == prefs.user!.jobTitle);
        print("firstWhere");
        // print(selectedCompany);
      } else {
        showError(res.data['message'] ?? "No data from backend");
      }
    } else {
      showError("Server Error");
    }
    notifyListeners();
  }

  //get Skillset

  List<SkillsetModel> skillsetList = [];
  void getSkillSet() async {
    print("entering the fn");
    showLoading();
    final res = await api.mentorRepo.getSkillset();
    print(res);
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        List tempskillsetList = res.data['Data'] as List;
        skillsetList =
            tempskillsetList.map((e) => SkillsetModel.fromJson(e)).toList();
        // selectedJob = domainExpertiseList
        //     .firstWhere((element) => element.name == prefs.user!.jobTitle);
        // print("firstWhere");
        // print(selectedCompany);
      } else {
        showError(res.data['message'] ?? "No data from backend");
      }
    } else {
      showError("Server Error");
    }
    notifyListeners();
  }

//post filter the mentor based on dropdown values
  // List filterList = [];
  bool isSelectedfilter = false;
  List<MentorModel> filterList = [];
  filter(FilterModel? filter) async {
    // selectedskillset = selectedSkill;
    // selectedJob = selectedjob;
    //TODO add parameters like this in function and Filter Widget
    FormData formData = FormData();
    formData.fields.addAll([
      MapEntry("skill", filter?.selectedSkillset ?? ""),
      MapEntry("domain_expertise", filter?.selectedDomain?.trim() ?? ""),
      MapEntry("experience", filter?.selectedDomain?.trim() ?? ""),
      MapEntry("job_title", filter?.selectedJobtitle?.trim() ?? ""),
    ]);
    showLoading();
    final res = await api.menteeRepo.filterMentee(formData, "mentorFilter");

    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        isSelectedfilter = true;

        List tempfilterList = res.data['data'] ?? [];

        filterList =
            tempfilterList.map((e) => MentorModel.fromjson(e)).toList();
        showNotification(res.data["message"]);

        notifyListeners();
      } else {
        // isSelectedfilter = false;
        notifyListeners();
      }
    } else {
      showError("Something went Wrong");
    }
  }

  void removeFilters() async {
    // formKey.currentState?.reset();

    selectedDomain = null;
    selectedskillset = null;
    notifyListeners();
  }
// //get Top MentorList
//   List tempmentorList = [];
//   List<MentorModel> topMentorList = [];
//   void getTopMentees() async {
//     showLoading();
//     final res = await api.menteeRepo.getTopMentors();
//     hideLoading();
//     if (res.runtimeType == Response) {
//       if (res.data['status'] == true) {
//         print("------");
//         tempmentorList = res.data['DATA'] as List;
//         topMentorList =
//             tempmentorList.map((e) => MentorModel.fromjson(e)).toList();
//         print(topMentorList);
//         print("+++++++++");
//         notifyListeners();
//       } else {
//         showError(res.data['message']);
//       }
//     } else {
//       showError("servere Error");
//     }
//   }
}
