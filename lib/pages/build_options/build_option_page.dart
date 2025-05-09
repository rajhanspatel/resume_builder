import 'package:resume_builder_2/pages/utills/heders_utills.dart';

class BuildOptionl extends StatefulWidget {
  const BuildOptionl({super.key});

  @override
  State<BuildOptionl> createState() => _BuildOptionlState();
}

class _BuildOptionlState extends State<BuildOptionl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          opTap: () {
            Navigator.of(context).pop();
          },
          msj: "Build Option",
          context: context),
      backgroundColor: const Color(0xff526D82),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 15.0, // spacing between rows
            crossAxisSpacing: 10.0, // spacing between columns
            mainAxisExtent: 225,
          ),
          padding: const EdgeInsets.all(8.0), // padding around the grid
          itemCount: MyRoutes.buildOptions.length, // total number of items
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MyRoutes.buildOptions[index]['route'],
                );
              },
              child: Container(
                // Style
                padding: const EdgeInsets.all(7),
                decoration: const BoxDecoration(
                  // ======================================================================================================
                  // color: const Color(0xff9DB2BF).withOpacity(0.75),
                  color: Color(0xff9DB2BF),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 5),
                        color: Colors.grey,
                        blurRadius: 10),
                  ],
                ),
                child: Column(
                  children: [
                    // Image
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        MyRoutes.buildOptions[index]['icon'],
                      ),
                    ),
                    const Divider(),
                    // Text
                    Expanded(
                      flex: 1,
                      child: Text(
                        MyRoutes.buildOptions[index]['title'],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.pdfPage);
        },
        backgroundColor: const Color(0xff526D82),
        label: const Text(
          "PDF",
          style: TextStyle(color: Color(0xffDDE6ED)),
        ),
        icon: const Icon(Icons.picture_as_pdf),
      ),
    );
  }
}
