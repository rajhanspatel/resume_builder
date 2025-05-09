import 'heders_utills.dart';

class MyRoutes {
  static String splashScreen = "/";
  static String homePage = "HomePage";
  static String bulidOptionalPage = "BulidOptionalPage";
  static String pdfPage = "PdfPage";

  static String iconPath = "lib/assets/icon";

  //BuildOptions
  static List buildOptions = [
    {
      'title': 'Personal info',
      'route': 'personal_info',
      'icon': '$iconPath/details.png',
    },
    {
      'title': 'Education',
      'route': 'education',
      'icon': '$iconPath/education.png',
    },
    {
      'title': 'Experience ',
      'route': 'experience',
      'icon': '$iconPath/experience.png',
    },
    /*{
      'title': 'Certified courses',
      'route': 'certified_courses',
      'icon': '$iconPath/certificate.png',
    },
    {
      'title': 'Projects ',
      'route': 'projects',
      'icon': '$iconPath/projects.png',
    },*/
    {
      'title': 'Technical skills',
      'route': 'technical_skills',
      'icon': '$iconPath/skills.png',
    },
    /*{
      'title': 'Hobbies',
      'route': 'hobbies',
      'icon': '$iconPath/hobbies.png',
    },
    {
      'title': 'Achievements',
      'route': 'achievements',
      'icon': '$iconPath/achievement.png',
    },
    {
      'title': 'About',
      'route': 'about_info',
      'icon': '$iconPath/info.png',
    },*/
  ];

  static Map<String, Widget Function(BuildContext)> route = {
    MyRoutes.splashScreen: (context) => const SplashScreen(),
    MyRoutes.homePage: (context) => const HomePage(),
    MyRoutes.bulidOptionalPage: (context) => const BuildOptionl(),
    MyRoutes.buildOptions[0]['route']: (context) => const PersonalInfo(),
    MyRoutes.buildOptions[1]['route']: (context) => const EducationPage(),
    MyRoutes.buildOptions[2]['route']: (context) => const ExperiencePage(),
    MyRoutes.buildOptions[3]['route']: (context) => const TechnicalSkill(),
    MyRoutes.pdfPage: (context) => const PdfPage(),
  };
}
