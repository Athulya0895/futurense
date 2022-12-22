import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/main.dart';
import 'package:futurensemobileapp/models/user_model.dart';

import 'package:futurensemobileapp/screens/mentee/setPreference/setPreference.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class MyAccountVM extends BaseViewModel {
  @override
  @override
  void onInit() {
    getUserDetails();
    user = prefs.user;
    getCurrentCompany();
    getJobtitle();
    getExperience();

    firstName.text = user!.mentorFirstName ?? " ";
    lastName.text = user!.mentorLastName ?? "";
    email.text = user!.mentorEmail ?? "";
    phoneNumber.text = user!.mentorMobile ?? "";
    linkedinid.text = user!.linkedinId ?? "";
    currentCompany.text = user!.currentCompany ?? "";
    jobTitle.text = user!.jobTitle ?? "";

    experience.text = user?.experience ?? "";
    about.text = user!.about ?? "";
    // selectedCompany = user!.currentCompany as CurrentCompanyModel?;

    // print("Current Company Name");
    // print(selectedCompany?.currentCompanyName);
    // selectedJob = user!.jobTitle as JobttileModel?;
    selectedCompany?.currentCompanyName = user?.currentCompany ?? "";
    // selectedJob = user!.jobTitle;
    // selectedExperience = user?.experience;
    selectedJob?.jobtitlename = user?.jobTitle ?? "";
    selectedExperience?.experienceName = user?.experience ?? "";

    notifyListeners();
  }

  final formKey = GlobalKey<FormState>();
  bool edit = false;
  //data storing
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController yourIndustry = TextEditingController();
  TextEditingController yourCity = TextEditingController();
  // TextEditingController jobtitle = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController linkedinid = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController industryexpertise = TextEditingController();
  TextEditingController currentCompany = TextEditingController();
  TextEditingController domainExpertise = TextEditingController();
  TextEditingController jobTitle = TextEditingController();

//dropdown selected value
  CurrentCompanyModel? selectedCompany;
  JobttileModel? selectedJob;
  ExperienceModel? selectedExperience;

//upload image
  File? image;

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      image = File(result.files.single.path!);
      notifyListeners();
    } else {}
  }

  final ImagePicker picker = ImagePicker();
  PickedFile? imageFile; //store image that is choosen from camera or gallery
  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.getImage(
      source: source,
    );
    // setState(() {
    imageFile = pickedFile;
    // });
    notifyListeners();
  }

//get userdetails
  UserModel? user;
  String? data;
  void getUserDetails() async {
    FormData formData = FormData();
    formData.fields.addAll([
      const MapEntry("fn", "GetAllFacultyById"), //get faculty by id
      const MapEntry("key", "F9U6R9EAN8S98E"),
      MapEntry("user_id", prefs.userId.toString()),
    ]);
    showLoading();
    final res = await api.mentorRepo.getMentor(formData);
    print(res);
    hideLoading();
    if (res.runtimeType == Response) {
      print("true response");
      if (res.data["status"] == true) {
        final data = res.data['data'];

        if (data?.isNotEmpty == true) {
          user = UserModel.fromJson(data);
          notifyListeners();
          prefs.user = user;

          about.text = user!.about ?? "";
          firstName.text = user!.mentorFirstName ?? "";
          lastName.text = user!.mentorLastName ?? "";
          email.text = user!.mentorEmail ?? "";
          phoneNumber.text = user!.mentorMobile ?? "";
          linkedinid.text = user!.linkedinId ?? "";
          currentCompany.text = user?.currentCompany ?? "";
          jobTitle.text = user!.jobTitle ?? "";
          experience.text = user?.experience ?? "";
          about.text = user!.about ?? "";
        }
        notifyListeners();
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("Server Error");
    }
    notifyListeners();
  }

  //dropdowns

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
        if (prefs.user != null) {
          selectedCompany = companyList.firstWhere(
              (element) => element.name == prefs.user?.currentCompany);
        }

        // }
      } else {
        showError(res.data['message'] ?? "no data from backend");
      }
    } else {
      showError("Server Error");
    }
  }

  //jobtile
  List<JobttileModel> jobtitleList = [];
  void getJobtitle() async {
    // FormData formData = FormData();
    // formData.fields.addAll([
    //   const MapEntry("fn", "GetDesignationDetails"),
    // ]);
    showLoading();
    final res = await api.mentorRepo.getJobtitle();

    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        List tempjobtitleList = res.data['Data'] as List;
        jobtitleList =
            tempjobtitleList.map((e) => JobttileModel.fromJson(e)).toList();
        if (prefs.user != null) {
          selectedJob = jobtitleList
              .firstWhere((element) => element.name == prefs.user!.jobTitle);
        }
      } else {
        showError(res.data['message'] ?? "No data from backend");
      }
    } else {
      showError("Server Error");
    }
    notifyListeners();
  }

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
        if (prefs.user != null) {
          selectedExperience = experiencesList
              .firstWhere((element) => element.name == prefs.user?.experience);
        }
      } else {
        showError(res.data['message'] ?? "No data from backend");
      }
    } else {
      showError("Server Error");
    }
    notifyListeners();
  }

  //update Profile
  void updateProfile(BuildContext context, {bool? home}) async {
    if (formKey.currentState!.validate()) {
      showLoading();

      FormData formData = FormData();
      if (image != null) {
        formData.files.add(MapEntry(
          "profile_pic",
          await MultipartFile.fromFile(image!.path),
        ));
      }
      formData.fields.addAll([
        MapEntry("Email", email.text),
        MapEntry("First_Name", firstName.text),
        MapEntry("Last_Name", lastName.text),
        MapEntry("Mobile", phoneNumber.text),
        MapEntry("Company_Name", selectedCompany?.currentCompanyName ?? ""),
        MapEntry("Job_Profile", selectedJob?.jobtitlename ?? ""),
        MapEntry("work_experience", selectedExperience?.experienceName ?? ""),
        MapEntry("about_you", about.text),
        MapEntry("LinkedIn", linkedinid.text),
      ]);
      final res = await api.mentorRepo.updateProfile(formData);
      hideLoading();

      if (res.runtimeType == Response) {
        if (res.data['status'] == true) {
          notifyListeners();
          await showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: Colors.white,
                elevation: 3,
                child: Container(
                  padding: const EdgeInsets.all(26),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset("assets/success.png"),
                      Center(
                        child: Lottie.asset('assets/Rescheduled.json',
                            fit: BoxFit.fill,
                            reverse: true,
                            repeat: false, onLoaded: (value) async {
                          await Future.delayed(value.duration);
                          if (home != true) {
                            Navigator.push(
                                MyApp.context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SetPrefrenceMentee()));
                            // Navigator.push(
                            //     MyApp.context, MaterialPageRoute(builder: (context) => Home()));
                          } else {
                            edit = false;
                            notifyListeners();
                          }
                        }),
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Changes Saved!",
                        style:
                            TextStyle(color: Color(0xff6EBFC3), fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
          // showNotification(res.data["message"]);
          // if (home != true) {
          //   Navigator.push(MyApp.context,
          //       MaterialPageRoute(builder: (context) => const SetPrefrenceMentee()));
          //   // Navigator.push(MyApp.context,
          //   //     MaterialPageRoute(builder: (context) => HomeMentee()));
          // } else {
          //   edit = false;
          //   notifyListeners();
          // }

        } else {
          showError(res.data["message"]);
        }
      } else {
        showError("Server Error");
      }
      notifyListeners();
    }
  }
}
