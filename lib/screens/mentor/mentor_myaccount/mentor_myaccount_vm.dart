import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


import 'package:futurensemobileapp/base/base_view_model.dart';

import 'package:futurensemobileapp/models/user_model.dart';


import 'package:futurensemobileapp/screens/mentor/setPreference/setpreference.dart';


import 'package:lottie/lottie.dart';


class MentorMyaccountVM extends BaseViewModel {
  bool showLottie = true;
  @override
  void onInit() {
    user = prefs.user;
    getUserDetails();
    getCurrentCompany();
    getJobtitle();
    getExperience();

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
  // var selectedCompany;
  // var selectedJob;
  // var selectedExperience;

// //LIST for adding multiple experience
//   final List<String> experienceList = <String>[];
//   //to add multiple item to list
//   void addItemToList() {
//     experienceList.insert(0, experience.text);
//     notifyListeners();
//   }

//upload image
  File? image;

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      image = File(result.files.single.path!);
      notifyListeners();
    } else {}
  }

  // final ImagePicker picker = ImagePicker();
  // PickedFile? imageFile; //store image that is choosen from camera or gallery
  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await picker.getImage(
  //     source: source,
  //   );
  //   // setState(() {
  //   imageFile = pickedFile;
  //   // });
  //   notifyListeners();
  // }

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

    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data["status"] == true) {
        final data = res.data['data'];
        user = UserModel.fromJson(data);

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
          currentCompany.text = user!.currentCompany ?? "";
          jobTitle.text = user!.jobTitle ?? "";
          experience.text = user?.experience ?? "";

          about.text = user!.about ?? "";
          selectedCompany?.currentCompanyName = prefs.user!.currentCompany;
          // image = MultipartFile.fromFile(prefs.user?.profilePic) as File?;
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
        selectedJob = jobtitleList
            .firstWhere((element) => element.name == prefs.user?.jobTitle);
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
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        List tempexperienceList = res.data['DATA'] as List;
        experiencesList =
            tempexperienceList.map((e) => ExperienceModel.fromJson(e)).toList();
        selectedExperience = experiencesList
            .firstWhere((element) => element.name == prefs.user?.experience);
      } else {
        showError(res.data['message'] ?? "No data from backend");
      }
    } else {
      showError("Server Error");
    }
    notifyListeners();
  }

//  void goto() async {
//     print(locator<SharedPrefs>().role == true);
//     Future.delayed(const Duration(seconds: 3)).then(
//       (_) {
//         locator<SharedPrefs>().isLogin
//             ? locator<SharedPrefs>().role == true
//                 ? Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => const Home(),
//                     ),
//                   )
//                 : Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => const HomeMentee(),
//                     ),
//                   )
//             : Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(builder: (context) => const Login()),
//                 (route) => false);
//       },
//     );
//   }

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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset("assets/success.png"),
                    Center(
                      child: Lottie.asset(
                        'assets/Rescheduled.json',
                        fit: BoxFit.fill,
                        reverse: false,
                        repeat: false,

                        //      onLoaded: (value) async {
                        //   await Future.delayed(value.duration);
                        //   if (home != true) {
                        //     Navigator.push(
                        //         MyApp.context,
                        //         MaterialPageRoute(
                        //             builder: (context) => SetPreferenceMentor()));
                        //     // Navigator.push(
                        //     //     MyApp.context, MaterialPageRoute(builder: (context) => Home()));
                        //   } else {
                        //     edit = false;
                        //     // showLottie = false;
                        //     notifyListeners();
                        //     Navigator.pop(context);
                        //   }
                        // }
                        onLoaded: (value) async {
                          Future.delayed(value.duration).then((value) {
                            if (home != true) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              const SetPreferenceMentor(),
                                      transitionDuration: Duration.zero,
                                      reverseTransitionDuration: Duration.zero),
                                  (route) => false);
                            } else {
                              edit = false;
                              // showLottie = false;
                              notifyListeners();
                              Navigator.pop(context);
                            }
                          });
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Changes Saved!",
                      style: TextStyle(color: Color(0xff6EBFC3), fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            },
          );

          // if (home != true) {
          //   Navigator.push(MyApp.context,
          //       MaterialPageRoute(builder: (context) => SetPreferenceMentor()));
          //   // Navigator.push(
          //   //     MyApp.context, MaterialPageRoute(builder: (context) => Home()));
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
