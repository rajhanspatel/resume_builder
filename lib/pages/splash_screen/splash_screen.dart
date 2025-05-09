import 'package:resume_builder_2/pages/utills/heders_utills.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, MyRoutes.homePage);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: Image(
                image: AssetImage("lib/assets/gif/splash_screen.gif"),
              ),
            ),
            Spacer(),
            LinearProgressIndicator(),
          ],
        ),
      ),
      backgroundColor: Color(0xff526D82),
    );
  }
}
