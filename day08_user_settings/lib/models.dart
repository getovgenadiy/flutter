enum Gender {FEMALE,MALE,OTHER}

enum PrograminLanguage{DART,KOTLIN,JAVA, JAVASCRIPT}

class Settings{
  late final String username;
  late final Gender gender;
  late final Set<PrograminLanguage> programingLangiases;
  late final bool isEmployed;
  late final String emailAddress;

  Settings(
      this.username, this.gender, this.programingLangiases, this.isEmployed, this.emailAddress);
}