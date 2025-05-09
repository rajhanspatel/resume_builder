import 'package:flutter/cupertino.dart';
import 'package:resume_builder_app/pages/utills/heders_utills.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.profile_circled),
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(color: Color(0xffDDE6ED)),
        ),
        backgroundColor: const Color(0xff27374D),
      ),
      //==================================================
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            signInCard(size: size),
          ],
        ),
      ),
      backgroundColor: const Color(0xff526D82),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff9DB2BF),
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.bulidOptionalPage);
        },
        label: const Text(
          "Create",
          style: TextStyle(color: Color(0xffDDE6ED)),
        ),
        icon: const IconTheme(
            data: IconThemeData(color: Color(0xffDDE6ED)),
            child: Icon(Icons.create_new_folder_outlined)),
      ),
    );
  }
}
