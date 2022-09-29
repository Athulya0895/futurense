import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Formatter {
  static formateDate(DateTime? date) {
    if (date != null) {
      return "${date.year}-${date.month}-${date.day}";
    } else {
      return null;
    }
  }

  static formateDateMail(DateTime? date) {
    if (date != null) {
      return "${date.day}.${date.month}.${date.year}";
    } else {
      return null;
    }
  }

  static formateDateString(String? tempDate) {
    DateTime? date = tempDate != null ? DateTime.parse(tempDate) : null;
    if (date != null) {
      return "${date.year}-${date.month}-${date.day}";
    } else {
      return " ";
    }
  }

  static formatTime(TimeOfDay? time) {
    if (time != null) {
      return DateFormat.jm()
          .format(DateTime(2000, 12, 12, time.hour, time.minute));
    } else {
      return "";
    }
  }

  static formatTimeSAP(TimeOfDay? time) {
    if (time != null) {
      return "${time.hour}:${time.minute}:00";
    } else {
      return "";
    }
  }
}
