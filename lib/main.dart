import 'pages/utills/heders_utills.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.splashScreen: (context) => const SplashScreen(),
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.bulidOptionalPage: (context) => const BuildOptionl(),
        MyRoutes.buildOptions[0]['route']: (context) => const PersonalInfo(),
        MyRoutes.buildOptions[5]['route']: (context) => const TechnicalSkill(),
        MyRoutes.buildOptions[2]['route']: (context) => const ExperiencePage(),
        MyRoutes.buildOptions[1]['route']: (context) => const EducationPage(),
        MyRoutes.pdfPage: (context) => const PdfPage(),
      },
    );
  }
}
