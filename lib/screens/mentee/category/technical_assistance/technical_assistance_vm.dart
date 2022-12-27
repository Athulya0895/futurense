import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/filter_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/models/user_model.dart';

class TechnicalAssistanceVM extends BaseViewModel {
  @override
  void onInit() {
    gettopTechmentors();
    getExperience();
    getJobtitle();
    getDomainExpertise();
    getSkillSet();
  }

  //get Top MentorList
  List temptechmentorList = [];
  List<MentorModel> topTechmentorList = [];
  void gettopTechmentors() async {
    showLoading();
    final res = await api.menteeRepo.getTopTechnicalMentee();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        temptechmentorList = res.data['DATA'] as List;
        topTechmentorList =
            temptechmentorList.map((e) => MentorModel.fromjson(e)).toList();

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

    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        List tempjobtitleList = res.data['Data'] as List;
        jobtitleList =
            tempjobtitleList.map((e) => JobttileModel.fromJson(e)).toList();
        // selectedJob = jobtitleList
        //     .firstWhere((element) => element.name == prefs.user!.jobTitle);

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

    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        List tempdomainExpertiseList = res.data['Data'] as List;
        domainExpertiseList = tempdomainExpertiseList
            .map((e) => DomainExpertiseModel.fromJson(e))
            .toList();
        // selectedJob = domainExpertiseList
        //     .firstWhere((element) => element.name == prefs.user!.jobTitle);

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
    showLoading();
    final res = await api.mentorRepo.getSkillset();

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
  FilterModel? selectedFilter;
  filter(FilterModel? filter) async {
    selectedFilter = filter;
    // selectedskillset = selectedSkill;
    // selectedJob = selectedjob;
    //TODO add parameters like this in function and Filter Widget
    FormData formData = FormData();
    formData.fields.addAll([
      MapEntry("skill", filter?.selectedSkillset?.skillName ?? ""),
      MapEntry("domain_expertise", filter?.selectedDomain?.expertiseName ?? ""),
      MapEntry("experience", filter?.selectedExperience?.experienceName ?? ""),
      MapEntry("job_title", filter?.selectedJobtitle?.jobtitlename ?? ""),
    ]);
    showLoading();
    final res = await api.menteeRepo
        .filterMentee(formData, "technicalAssistanceFilter");

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
      showError("Something Went Wrong");
    }
  }
}
