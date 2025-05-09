import 'package:resume_builder_app/pages/utills/heders_utills.dart';

AppBar appBar(
    {required Function()? opTap,
    required String msj,
    required BuildContext context}) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      color: const Color(0xffDDE6ED),
      onPressed: opTap,
    ),
    title: Text(
      msj,
      style: const TextStyle(color: Color(0xffDDE6ED)),
    ),
    backgroundColor: const Color(0xff27374D),
  );
}
