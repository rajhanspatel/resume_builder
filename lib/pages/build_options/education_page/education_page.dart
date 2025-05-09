import 'package:resume_builder_2/pages/utills/heders_utills.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: appBar(
            opTap: () {
              Navigator.of(context).pop();
            },
            msj: "Education",
            context: context),
        //====================================
        backgroundColor: const Color(0xff526D82),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: educationForm(formKey: formKey, context: context),
        ),
      ),
    );
  }
}
