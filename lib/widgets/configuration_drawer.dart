import 'package:flutter/material.dart';
import 'package:iitj_autoproxy/screens/configuration_screen.dart';
import 'package:provider/provider.dart';

class ConfigurationDrawer extends StatelessWidget {
  const ConfigurationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ConfigurationState configurationState = context.watch<ConfigurationState>();

    Widget drawerHeader = const DrawerHeader(
      child: Center(
        child: Text(
          "IITJ Autoproxy",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );

    Widget configureTile = ListTile(
      title: const Center(child: Text("Configure")),
      subtitle: Center(
          child: configurationState.isEmpty()
              ? const Text("No configurations found")
              : const Text("Configured")),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const ConfigurationScreen();
        }));
      },
    );

    return Drawer(
        child: Column(
      children: [
        drawerHeader,
        configureTile,
      ],
    ));
  }
}
