import 'package:flutter/material.dart';
import 'package:iitj_autoproxy/utils/logging_utils.dart';
import 'package:iitj_autoproxy/utils/storage_utils.dart';
import 'package:provider/provider.dart';

class ConfigurationState extends ChangeNotifier {
  Map<String, String> configuration = {};
  String key = "";

  void initializeConfiguration(String key) {
    this.key = key;

    fetchConfiguration(this.key).then((configurationMap) {
      configuration = configurationMap;

      notifyListeners();
    }).catchError((error) {
      logger.e("Error fetching configuration: $error");
    });

    return;
  }

  bool isEmpty() {
    if (configuration.length == 2) {
      return true;
    }

    return false;
  }

  void configure(String username, String password) {
    configuration["username"] = username;
    configuration["password"] = password;

    saveConfiguration(configuration, key).then((_) {
      notifyListeners();
    }).catchError((error) {
      logger.e("Error saving configuration: $error");
    });
  }
}

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ConfigurationState configurationState = context.watch<ConfigurationState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Configure Autoproxy"),
      ),
    );
  }
}
