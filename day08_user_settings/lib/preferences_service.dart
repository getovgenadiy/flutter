import 'package:day08_user_settings/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencessService {
  Future saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('username', settings.username);
    await preferences.setBool('isEmployed', settings.isEmployed);
    await preferences.setInt('gender', settings.gender.index);
    await preferences.setStringList('programingLanguages',
        settings.programingLangiases.map((e) => e.index.toString()).toList());
    await preferences.setString('emailAddress', settings.emailAddress);
  }

  Future<Settings> getSettings() async {
    final preferences = await SharedPreferences.getInstance();

    final username = preferences.getString('username');
    final isEmployed = preferences.getBool('isEmployed');
    final gender = Gender.values[preferences.getInt('gender') ?? 0];

    final programmingLanguagesIndicies =
        preferences.getStringList('programingLanguages');

    final programmingLanguages = programmingLanguagesIndicies!
        .map((stringIndex) => PrograminLanguage.values[int.parse(stringIndex)])
        .toSet();
    final emailAddress = preferences.getString('emailAddress');
    print('Email is $emailAddress');

    return Settings(username!, gender, programmingLanguages, isEmployed!, emailAddress!);
  }
}
