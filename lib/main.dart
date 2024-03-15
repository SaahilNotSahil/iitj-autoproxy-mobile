import 'package:flutter/material.dart';
import 'package:iitj_autoproxy/screens/configuration_screen.dart';
import 'package:iitj_autoproxy/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          ConfigurationState configurationState = ConfigurationState();

          configurationState
              .initializeConfiguration("iitj_autoproxy_configuration");

          return configurationState;
        }),
      ],
      child: MaterialApp(
        title: 'IITJ Autoproxy',
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
