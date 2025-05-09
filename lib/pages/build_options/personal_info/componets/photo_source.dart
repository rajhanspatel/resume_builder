import 'package:resume_builder_app/pages/utills/heders_utills.dart';

Widget imageOption(
    {required Icon icon,
    required Text text,
    required ImageSource source,
    required BuildContext context}) {
  return Row(
    children: [
      TextButton.icon(
        onPressed: () async {
          ImagePicker picker = ImagePicker();

          XFile? file = await picker.pickImage(
            source: source,
          );

          if (file != null) {
            Globals.globals.image = File(file.path);
          }
          Navigator.pop(context);
        },
        icon: icon,
        label: text,
      ),
    ],
  );
}
