import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:futurensemobileapp/main.dart';
import 'package:futurensemobileapp/screens/auth/login/login.dart';
import '../components/dialog/loading_popup.dart';
import '/base/base_view_model.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

mixin BasePage<T extends BaseViewModel> {
  late T _provider;

  T get provider => _provider;

  @protected
  T create();

  @protected
  void initialise(BuildContext context);

  Widget builder(Widget Function() builder) => ChangeNotifierProvider<T>(
        create: (context) {
          _provider = create();

          _provider.onShowLoading = () {
            LoadingPopup.show(MyApp.context);
          };

          _provider.onHideLoading = () {
            Navigator.of(MyApp.context).pop();
          };

          _provider.onShowError = (message) {
            Fluttertoast.showToast(
                msg: message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                // timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white);
            // ScaffoldMessenger.of(MyApp.context).showSnackBar(
            //     SnackBar(content: Text(message), backgroundColor: Colors.red));
          };

          _provider.onShowNotification = (message) {
            Fluttertoast.showToast(
                msg: message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                // timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white);
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: Text(message),
            //   backgroundColor: Colors.green,
            // ));

// Snackbar snackbar= Snackbar.make(view, text, duration);
// snackbar.setAnchorView(bottomBar);
            // PopupMessage.showNotification(context, message);
          };

          _provider.onLogOut = () {
            _provider.prefs.removeAll();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
                (route) => false);
          };

          initialise(context);

          return _provider;
        },
        child: Consumer<T>(
          builder: (context, provider, _) {
            _provider = provider;

            state() {
              switch (provider.state) {
                case ChangeState.clone:
                  return Container(child: builder.call());
                case ChangeState.blank:
                  return const Scaffold();
                case ChangeState.loading:
                case ChangeState.page:
                  return builder.call();
                default:
                  return builder.call();
              }
            }

            return VisibilityDetector(
              onVisibilityChanged: (info) {
                if (info.visibleFraction >= 1) {
                  try {
                    _provider.appear();
                  } catch (_) {}
                } else if (info.visibleFraction <= 0) {
                  try {
                    // _provider.disAppear();
                  } catch (_) {}
                }
              },
              key: Key(T.toString()),
              child: GestureDetector(
                child: state(),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            );
          },
        ),
      );
}
