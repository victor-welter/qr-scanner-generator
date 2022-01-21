import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_generator/settings/user_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final _userPreferences = Provider.of<UserPreferences>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: SwitchListTile(
          title: const Text('Modo escuro'),
          subtitle: const Text(
            'Quando selecionado o sistema ajustará automaticamente a sua aparência com base nas configurações do seu dispositivo',
            textAlign: TextAlign.justify,
          ),
          activeColor: Colors.teal,
          value: _userPreferences.usesDarkTheme(),
          onChanged: (value) {
            setState(() {
              _userPreferences.useDartTheme(value);
            });
          },
        ),
      ),
    );
  }
}
