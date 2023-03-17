import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/filter_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/models/user_model.dart';

class MenteeListVM extends BaseViewModel {
  @override
  void onInit() {
    getTopMentees();
    getExperience();
    getJobtitle();
    getDomainExpertise();
    getSkillSet();
  }

  //get topMentees
  //get Top MentorList
  List tempmenteeList = [];
  List<MentorModel> topMenteeList = [];
  void getTopMentees() async {
    showLoading();
    final res = await api.mentorRepo.getTopMentees();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        tempmenteeList = res.data['DATA'] as List;
        topMenteeList =
            tempmenteeList.map((e) => MentorModel.fromjson(e)).toList();

        notifyListeners();
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("server Error");
    }
  }

//Filters

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
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        List tempexperienceList = res.data['DATA'] as List;
        experiencesList =
            tempexperienceList.map((e) => ExperienceModel.fromJson(e)).toList();
      } else {
        showError(res.data['message'] ?? "No data from backend");
      }
    } else {
      showError("Server Error");
    }
    notifyListeners();
  }

  //jobtile
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
      } else {
        showError(res.data['message'] ?? "No data from backend");
      }
    } else {
      showError("Server Error");
    }
    notifyListeners();
  }

  //get Currentcompany
  List<CurrentCompanyModel> companyList = [];
  void getCurrentCompany() async {
    FormData formData = FormData();
    formData.fields.addAll([
      const MapEntry("fn", "GetCompanyDetails"), //get faculty by id
    ]);
    showLoading();
    final res = await api.mentorRepo.getCurrentCompany(formData);

    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        List tempCompanylist = res.data['Data'] as List;
        companyList = tempCompanylist
            .map((e) => CurrentCompanyModel.fromJson(e))
            .toList();
      } else {
        showError(res.data['message'] ?? "no data from backend");
      }
    } else {
      showError("Server Error");
    }
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

//post filter the mentee based on dropdown values
  // List filterList = [];
  bool isSelectedfilter = false;
  List<MentorModel> filterList = [];
  FilterModel? selectedFilter;
  filter(FilterModel? filter) async {
    selectedFilter = filter;
    // selectedskillset = selectedSkill;
    //TODO add parameters like this in function and Filter Widget
    FormData formData = FormData();
    formData.fields.addAll([
      MapEntry("skill", filter?.selectedSkillset?.skillName ?? ""),
      MapEntry("domain_expertise", filter?.selectedDomain?.expertiseName ?? ""),
      MapEntry("experience", filter?.selectedExperience?.experienceName ?? ""),
      MapEntry("job_title", filter?.selectedJobtitle?.jobtitlename ?? ""),
    ]);
    showLoading();
    final res = await api.mentorRepo.filterMentor(formData, "menteeFilter");

    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        isSelectedfilter = true;
    
        List tempfilterList = res.data['data'] ?? [];
        tempfilterList.isEmpty ? print("emptyfilterList") : print("filterList");
     
        filterList =
            tempfilterList.map((e) => MentorModel.fromjson(e)).toList();
        // showNotification(res.data["message"]);

        // print("filterList");
        // print(filterList);
        // print("filterList");
        notifyListeners();
      } else {
        // isSelectedfilter = false;
        notifyListeners();

        print("false");
      }
    } else {
      print("Something Went Wrong");
    }
  }
}
