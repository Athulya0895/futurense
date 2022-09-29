import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';

class ChatVm extends BaseViewModel {
  @override
  void onInit() {
    // TODO: implement onInit
  }
  List<String> messages = [];
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  int? todayStartIndex;
}
