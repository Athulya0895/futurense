import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/user_model.dart';

class MentorMyaccountVM extends BaseViewModel {
  @override
  void onInit() {
    user = prefs.user;
    getUserDetails();
    firstName.text = user!.mentorName ?? " ";
    email.text = user!.mentorEmail ?? "";
    phoneNumber.text = user!.mentorMobile ?? "";

    print(user!.mentorName.toString());
    print("object");
  }

  //data storing
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController yourIndustry = TextEditingController();
  TextEditingController yourCity = TextEditingController();
  TextEditingController jobtitle = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController linkedinid = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController industryexpertise = TextEditingController();

//LIST for adding multiple experience
  final List<String> experienceList = <String>[];
  //to add multiple item to list
  void addItemToList() {
    experienceList.insert(0, experience.text);
    notifyListeners();
  }

//get userdetails
  UserModel? user;
  // List data = [];
  void getUserDetails() async {
    showLoading();
    FormData formData = FormData();
    formData.fields.addAll([
      const MapEntry("fn", "GetAllFacultyById"), //get faculty by id
      const MapEntry("key", "F9U6R9EAN8S98E"),
      MapEntry("user_id", prefs.userId.toString()),
    ]);
    showLoading();
    final res = await api.mentorRepo.getMentor(formData);
    // print(res);
    hideLoading();
    if (res.runtimeType == Response) {
      print("true response");
      if (res.data["SUCCESS"] == "TRUE") {
        final data = res.data['DATA'];

        if (data?.isNotEmpty == true) {
          user = UserModel.fromJson(data);
          notifyListeners();
          prefs.user = user;
          print("pref user");
          print(prefs.user);
        }
        notifyListeners();
      } else {
        showError(res.data['MESSAGE']);
      }
    } else {
      showError("Server Error");
    }
  }
}



// login(BuildContext context) async {
//     if (formKey.currentState!.validate()) {
//       FormData formData = FormData();
//       formData.fields.addAll([
//         const MapEntry("fn", "Login"),
//         const MapEntry("key", "tR3PYbcVNZZ796tH88S4VQ2"),
//         MapEntry("username", emailController.text),
//         MapEntry("password", passwordController.text),
//       ]);
//       showLoading();
//       final response = await api.authRepo.login(formData);
//       print(response);
//       hideLoading();
//       if (response.runtimeType == Response) {
//         print("response");
//         if (response.data['SUCCESS'] == "TRUE") {
//           print("true");
//           prefs.token = response.data['TOKEN'];
//           print(prefs.token);
//           response.data['ROLE'] == "MENTORS"
//               ? Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => SetPreferenceMentor()),
//                   (route) => false)
//               : Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => SetPrefrenceMentee()),
//                   (route) => false);
//         } else {
//           showError(response.data['MESSAGE'] ?? "Login failed");
//         }
//       } else {
//         showError("Server Error");
//       }
//     }
//   }