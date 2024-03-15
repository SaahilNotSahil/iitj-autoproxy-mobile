import 'package:iitj_autoproxy/utils/logging_utils.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';

Future<Map<String, String>> fetchConfiguration(String key) async {
  var pref = await SecureSharedPref.getInstance();

  late Map<String, String> configuration;

  var savedMap = await pref.getMap(key, isEncrypted: true);
  if (savedMap != null) {
    if (savedMap.isNotEmpty) {
      configuration = Map<String, String>.from(savedMap);
    } else {
      configuration = {
        "base_url": "http://www.gstatic.com/generate_204",
        "login_base_url": "https://gateway.iitj.ac.in:1003/"
      };
    }
  } else {
    configuration = {
      "base_url": "http://www.gstatic.com/generate_204",
      "login_base_url": "https://gateway.iitj.ac.in:1003/"
    };
  }

  return configuration;
}

Future<void> saveConfiguration(
    Map<String, String> configuration, String key) async {
  var pref = await SecureSharedPref.getInstance();

  pref.putMap(key, Map<dynamic, dynamic>.from(configuration),
      isEncrypted: true);
}
