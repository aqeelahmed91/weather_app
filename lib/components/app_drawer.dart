import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final void Function()? onTap;
  const AppDrawer({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 80, bottom: 40),
            child: Icon(
              Icons.cloudy_snowing,
              color: Theme.of(context).colorScheme.primary,
              size: 80,
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.primary,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            onTap: () => Navigator.popAndPushNamed(context, "/settings"),
            title: Text("Settings"),
            leading: Icon(Icons.settings),
            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            titleAlignment: ListTileTitleAlignment.center,
            iconColor: Theme.of(context).colorScheme.primary,
          )
        ],
      ),
    );
  }
}
