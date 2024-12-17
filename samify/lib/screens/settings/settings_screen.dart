import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samify/providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Consumer<SettingsProvider>(
        builder: (context, settings, _) {
          return ListView(
            children: [
              SwitchListTile(
                title: const Text('Dark Mode'),
                subtitle: const Text('Enable dark theme'),
                value: settings.settings.darkMode,
                onChanged: (_) => settings.toggleDarkMode(),
              ),
              SwitchListTile(
                title: const Text('Offline Mode'),
                subtitle: const Text('Access your downloaded music'),
                value: settings.settings.offlineMode,
                onChanged: (_) => settings.toggleOfflineMode(),
              ),
              ListTile(
                title: const Text('Audio Quality'),
                subtitle: Text(settings.settings.audioQuality),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showAudioQualityDialog(context),
              ),
              SwitchListTile(
                title: const Text('Auto Download'),
                subtitle: const Text('Automatically download liked songs'),
                value: settings.settings.autoDownload,
                onChanged: (value) => settings.updateSettings(
                  settings.settings.copyWith(autoDownload: value),
                ),
              ),
              SwitchListTile(
                title: const Text('Data Saver'),
                subtitle: const Text('Reduce data usage while streaming'),
                value: settings.settings.dataSaver,
                onChanged: (value) => settings.updateSettings(
                  settings.settings.copyWith(dataSaver: value),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showAudioQualityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Audio Quality'),
        children: [
          SimpleDialogOption(
            child: const Text('Low (96kbps)'),
            onPressed: () {
              context.read<SettingsProvider>().setAudioQuality('low');
              Navigator.pop(context);
            },
          ),
          SimpleDialogOption(
            child: const Text('Medium (160kbps)'),
            onPressed: () {
              context.read<SettingsProvider>().setAudioQuality('medium');
              Navigator.pop(context);
            },
          ),
          SimpleDialogOption(
            child: const Text('High (320kbps)'),
            onPressed: () {
              context.read<SettingsProvider>().setAudioQuality('high');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}