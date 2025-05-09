import 'package:resume_builder_2/pages/utills/heders_utills.dart';

import 'dart:developer';

class TechnicalSkill extends StatefulWidget {
  const TechnicalSkill({super.key});

  @override
  State<TechnicalSkill> createState() => _TechnicalSkillState();
}

class _TechnicalSkillState extends State<TechnicalSkill> {
  @override
  void initState() {
    if (Globals.controller.length > 2) {
      Globals.controller.removeWhere((element) => element.text.isEmpty);
    }
    if (Globals.controller.isEmpty || Globals.controller.length < 2) {
      if (Globals.controller.length == 1) {
        Globals.controller.add(TextEditingController());
      } else {
        Globals.controller.addAll([
          TextEditingController(),
          TextEditingController(),
        ]);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("================CONTROLLER====================");
    for (var element in Globals.controller) {}
    log("================SKILLS=======================");
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: appBar(
          opTap: () {
            Navigator.pop(context);
          },
          msj: "Technical Skill",
          context: context,
        ),
        // ===================================\
        backgroundColor: const Color(0xff526D82),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: size.width * 0.9,
            decoration: BoxDecoration(
              color: const Color(0xff9DB2BF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Skills',
                      style: TextStyle(fontSize: 20),
                    ),
                    ...List.generate(
                      Globals.controller.length,
                      (index) => Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: Globals.controller[index],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Globals.controller.removeAt(index);
                              setState(() {});
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Globals.controller.add(TextEditingController());
                        setState(() {});
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
