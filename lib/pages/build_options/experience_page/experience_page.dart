import 'package:resume_builder_app/pages/utills/heders_utills.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: appBar(
          context: context,
          msj: "Experience",
          opTap: () => Navigator.pop(context),
        ),
        //==================================================================

        backgroundColor: const Color(0xff526D82),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            color: Color(0xff526D82).withOpacity(0.5),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Material(
                    elevation: 5,
                    shadowColor: const Color.fromARGB(120, 97, 53, 254),
                    borderRadius: BorderRadius.circular(20),
                    child: TextFormField(
                      onSaved: (val) {
                        Globals.globals.cmpname = val;
                      },
                      validator: (val) =>
                          val!.isEmpty ? '* Must Be Enter company name' : null,
                      onFieldSubmitted: (val) {
                        formKey.currentState!.validate();
                      },
                      initialValue: Globals.globals.cmpname,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Company Name',
                        hintText: 'E g. Appstone Lab',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Material(
                    elevation: 5,
                    shadowColor: const Color.fromARGB(120, 97, 53, 254),
                    borderRadius: BorderRadius.circular(20),
                    child: TextFormField(
                      onSaved: (val) {
                        Globals.globals.jobtime = val;
                      },
                      validator: (val) =>
                          val!.isEmpty ? '*Must Be Enter Anyone' : null,
                      onFieldSubmitted: (val) {
                        formKey.currentState!.validate();
                      },
                      initialValue: Globals.globals.jobtime,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Work Time',
                        hintText: 'E g. Full Time',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Material(
                    elevation: 5,
                    shadowColor: const Color.fromARGB(120, 97, 53, 254),
                    borderRadius: BorderRadius.circular(20),
                    child: TextFormField(
                      onSaved: (val) {
                        Globals.globals.role = val;
                      },
                      maxLines: 3,
                      initialValue: Globals.globals.role,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintMaxLines: 3,
                        labelText: 'Role (Optional)',
                        hintText: 'E g. Working with team members to come up '
                            'with new concepts & product analysis',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  //Button
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Save Button
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                mySnackBar(
                                  content: formKey.currentState!.validate()
                                      ? "Form saved"
                                      : "Failed to validate the form",
                                  color: formKey.currentState!.validate()
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff9DB2BF),
                              foregroundColor: Colors.white,
                            ),
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        //Reset Button
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Globals.globals.reset();
                              formKey.currentState!.reset();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff9DB2BF),
                              foregroundColor: Colors.white,
                            ),
                            child: const Text(
                              'Reset',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
