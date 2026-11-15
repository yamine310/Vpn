import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Settings',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          const ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Account'),
            subtitle: Text('Manage your account'),
          ),

          const Divider(),

          const ListTile(
            leading: Icon(Icons.workspace_premium),
            title: Text('Upgrade to Premium'),
            subtitle: Text('Unlock all VPN locations'),
          ),

          const Divider(),

          const ListTile(
            leading: Icon(Icons.privacy_tip_outlined),
            title: Text('Privacy Policy'),
          ),

          const Divider(),

          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About MD VPN'),
            subtitle: Text('Version 1.0.0'),
          ),
        ],
      ),
    );
  }
}