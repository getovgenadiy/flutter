import 'package:day08_user_settings/preferences_service.dart';
import 'package:flutter/material.dart';

import 'models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _preferencesService = PreferencessService();
  final _userNameController = TextEditingController();
  final _emailAddressController = TextEditingController();
  var _selectedGender = Gender.FEMALE;
  var _selectedLanguages = Set<PrograminLanguage>();
  var _isEmployed = false;

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() async {
    final settings = await _preferencesService.getSettings();
    setState(() {
      _userNameController.text= settings.username;
      _selectedGender =settings.gender;
      _selectedLanguages = settings.programingLangiases;
      _isEmployed = settings.isEmployed;
      _emailAddressController.text=settings.emailAddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Preferences Getov'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: TextField(
                controller: _userNameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
            ),
            ListTile(
              title: TextField(
                controller: _emailAddressController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            RadioListTile(
                title: Text('Female'),
                value: Gender.FEMALE,
                groupValue: _selectedGender,
                onChanged: (newValue) =>
                    setState(() => _selectedGender = newValue as Gender)),
            RadioListTile(
                title: Text('Male'),
                value: Gender.MALE,
                groupValue: _selectedGender,
                onChanged: (newValue) =>
                    setState(() => _selectedGender = newValue as Gender)),
            RadioListTile(
                title: Text('Other'),
                value: Gender.OTHER,
                groupValue: _selectedGender,
                onChanged: (newValue) =>
                    setState(() => _selectedGender = newValue as Gender)),
            CheckboxListTile(
                title: Text('Dart'),
                value: _selectedLanguages.contains(PrograminLanguage.DART),
                onChanged: (boll) {
                  setState(() {
                    _selectedLanguages.contains(PrograminLanguage.DART)
                        ? _selectedLanguages.remove(PrograminLanguage.DART)
                        : _selectedLanguages.add(PrograminLanguage.DART);
                  });
                }),
            CheckboxListTile(
                title: Text('Kotlin'),
                value: _selectedLanguages.contains(PrograminLanguage.KOTLIN),
                onChanged: (bool) {
                  setState(() {
                    _selectedLanguages.contains(PrograminLanguage.KOTLIN)
                        ? _selectedLanguages.remove(PrograminLanguage.KOTLIN)
                        : _selectedLanguages.add(PrograminLanguage.KOTLIN);
                  });
                }),
            CheckboxListTile(
                title: Text('Java'),
                value: _selectedLanguages.contains(PrograminLanguage.JAVA),
                onChanged: (bool) {
                  setState(() {
                    _selectedLanguages.contains(PrograminLanguage.JAVA)
                        ? _selectedLanguages.remove(PrograminLanguage.JAVA)
                        : _selectedLanguages.add(PrograminLanguage.JAVA);
                  });
                }),
            CheckboxListTile(
                title: Text('Javascript'),
                value:
                    _selectedLanguages.contains(PrograminLanguage.JAVASCRIPT),
                onChanged: (bool) {
                  setState(() {
                    _selectedLanguages.contains(PrograminLanguage.JAVASCRIPT)
                        ? _selectedLanguages
                            .remove(PrograminLanguage.JAVASCRIPT)
                        : _selectedLanguages.add(PrograminLanguage.JAVASCRIPT);
                  });
                }),
            SwitchListTile(
                title: Text('Is Employed'),
                value: _isEmployed,
                onChanged: (newVal) {
                  setState(() {
                    _isEmployed = newVal;
                  });
                }),
            TextButton(onPressed: _saveSettings, child: Text('Save Settings'))
          ],
        ),
      ),
    );
  }
  void _saveSettings(){
      final newSettings = Settings(_userNameController.text,
          _selectedGender, _selectedLanguages, _isEmployed, _emailAddressController.text);
      print(newSettings);
      _preferencesService.saveSettings(newSettings);
  }
}
