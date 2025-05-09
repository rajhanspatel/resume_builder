import 'package:resume_builder_app/pages/utills/heders_utills.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  bool _Profile = true;

  Future<void> pickImageWithCamera() async {
    ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (file != null) {
      Globals.globals.image = File(file.path);
      setState(() {});
    }
  }

  Future<void> pickImageWithGallery() async {
    ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (file != null) {
      Globals.globals.image = File(file.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    TextStyle headingStyle = const TextStyle(
      fontSize: 36,
      color: Color(0xffDDE6ED),
      shadows: <Shadow>[
        Shadow(
          offset: Offset(2.5, 2.5),
          blurRadius: 2.0,
          color: Colors.grey,
        ),
      ],
    );

    return Scaffold(
      // -----------
      appBar: appBar(
        opTap: () {
          Navigator.of(context).pop();
        },
        msj: "Personal Info",
        context: context,
      ),
      backgroundColor: const Color(0xff526D82),
      // --------------
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ChoiceRow
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Form
                GestureDetector(
                  onTap: () {
                    _Profile = true;
                    setState(() {});
                  },
                  child: Container(
                    height: size.height * 0.055,
                    width: size.width * 0.45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45),
                      color: const Color(0xff9DB2BF),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(35),
                        topLeft: Radius.circular(35),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(4, 4),
                          color: Colors.grey,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Text(
                      "Profile",
                      style: headingStyle,
                    ),
                  ),
                ),
                // Picker
                GestureDetector(
                  onTap: () {
                    _Profile = false;
                    setState(() {});
                  },
                  child: Container(
                    height: size.height * 0.055,
                    width: size.width * 0.45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45),
                      color: const Color(0xff9DB2BF),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(35),
                        bottomLeft: Radius.circular(35),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(4, 4),
                          color: Colors.grey,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Text(
                      "Picture",
                      style: headingStyle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Stack(
              children: [
                ////0
                Visibility(
                    visible: _Profile, child: formWidget(context: context)),
                ////1
                Visibility(
                  visible: !_Profile,
                  child: Container(
                    height: size.height * 0.28,
                    width: size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xff9DB2BF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(3.5, 3.5),
                          color: Colors.grey,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        SizedBox(
                          height: size.height * 0.2,
                          child: CircleAvatar(
                            radius: size.height * 0.1,
                            foregroundImage: Globals.globals.image != null
                                ? FileImage(Globals.globals.image!)
                                : null,
                          ),
                        ),
                        FloatingActionButton.small(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Row(
                                    children: [
                                      Text("Select optioon"),
                                      Spacer(),
                                    ],
                                  ),
                                  content: Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          pickImageWithCamera();
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Camera"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          pickImageWithGallery();
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Gallery"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.camera,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
