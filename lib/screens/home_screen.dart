import 'package:flutter/material.dart';
import 'package:iitj_autoproxy/widgets/configuration_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("IITJ Autoproxy")),
      drawer: const ConfigurationDrawer(),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Login"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Schedule"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Logout"),
              ),
            ],
          )),
    );
  }
}
