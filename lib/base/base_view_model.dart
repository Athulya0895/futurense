import 'package:flutter/material.dart';

import '../api/api_client.dart';
import '../utils/locator.dart';
import '../utils/share_prefs.dart';

abstract class BaseViewModel extends ChangeNotifier {
  final api = locator<ApiClient>();
  final prefs = locator<SharedPrefs>();
  bool _isFirst = true;
  bool _showLoading = false;
  bool isloading = false;
  ChangeState state = ChangeState.page;
  VoidCallback? onShowLoading, onHideLoading, onLogOut;
  void Function(String)? onShowError, onShowNotification;
  BaseViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onInit();
    });
  }

  @protected
  void onInit();

  void showLoading() {
    if (!_showLoading) {
      _showLoading = true;
      isloading = true;
      onShowLoading?.call();
      notifyListeners();
    }
  }

  void hideLoading() {
    if (_showLoading) {
      isloading = false;
      _showLoading = false;
      onHideLoading?.call();
      notifyListeners();
    }
  }

  void changeState(ChangeState newState) {
    state = newState;
    notifyListeners();
  }

  void showError(String message) {
    hideLoading();
    onShowError?.call(message);
  }

  void showNotification(String message) {
    hideLoading();
    onShowNotification?.call(message);
  }

  void logOut() {
    onLogOut?.call();
  }

  // void showErrorConnection() {
  //   hideLoading();
  //   (Connectivity().checkConnectivity()).then(
  //     (value) {
  //       if (value == ConnectivityResult.none) {
  //         showError("message_error_lost_connect");
  //         return;
  //       }
  //       showError("message_error_process_failure");
  //     },
  //   );
  // }

  void appear() {
    if (_isFirst) {
      _isFirst = false;
      return;
    }

    try {
      // onAppear.call();
    } catch (_) {}
  }

  // external void onAppear();

  // void disAppear() {
  //   if (_isFirst) return;

  //   try {
  //     onDisAppear();
  //   } catch (_) {}
  // }

  // external void onDisAppear();
}

enum ChangeState { loading, blank, page, serverError, clone }
