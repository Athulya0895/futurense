import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/filter_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/models/user_model.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_list/widgets/filter.dart';

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
        print("------");
        tempmenteeList = res.data['DATA'] as List;
        topMenteeList =
            tempmenteeList.map((e) => MentorModel.fromjson(e)).toList();
        print(topMenteeList);
        print("+++++++++");
        notifyListeners();
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("servere Error");
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
        print("true status");
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
    print(res);
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        List tempdomainExpertiseList = res.data['Data'] as List;
        domainExpertiseList = tempdomainExpertiseList
            .map((e) => DomainExpertiseModel.fromJson(e))
            .toList();

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

//post filter the mentee based on dropdown values
  // List filterList = [];
  bool isSelectedfilter = false;
  List<MentorModel> filterList = [];
  filter(FilterModel? filter) async {
    // selectedskillset = selectedSkill;
    //TODO add parameters like this in function and Filter Widget
    FormData formData = FormData();
    formData.fields.addAll([
      MapEntry("skill", filter?.selectedSkillset ?? ""),
      MapEntry("domain_expertise", filter?.selectedDomain?.trim() ?? ""),
      MapEntry("experience", filter?.selectedDomain?.trim() ?? ""),
      MapEntry("job_title", filter?.selectedJobtitle?.trim() ?? ""),
    ]);
    showLoading();
    final res = await api.mentorRepo.filterMentor(formData, "menteeFilter");
    print(res);
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        isSelectedfilter = true;
        print("true");
        List tempfilterList = res.data['data'];
        print(filterList);
        filterList =
            tempfilterList.map((e) => MentorModel.fromjson(e)).toList();
        showNotification(res.data["message"]);
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
