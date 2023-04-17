import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';

class WritePostVM extends BaseViewModel {
  @override
  void onInit() {
    // TODO: implement onInit
  }
  TextEditingController topic = TextEditingController();
  List<String> tags = [
    'Data Specialist',
    'Python Developer',
    'Odoo Developer',
    'Cloud Engineer',
    'Technology',
  ];
  var selectedTags;

  TextEditingController writeThoughts = TextEditingController();
  File? image;
  //for uploading image/pdf/video
  Future pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'mp4'],
    );

    if (result != null) {
      // PlatformFile file = result.files.first;
      image = File(result.files.single.path!);
      notifyListeners();
      // Do something with the file, such as uploading it to a server
    } else {
      // User canceled the picker
    }
  }

  //remove file
  void removeFile() {
    image = null;
    notifyListeners();
  }
}
