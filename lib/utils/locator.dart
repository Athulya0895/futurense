import 'package:get_it/get_it.dart';
import '../api/api_client.dart';
import 'share_prefs.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiClient());
  locator.registerLazySingleton(() => SharedPrefs());
}
