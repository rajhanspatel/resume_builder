import 'package:resume_builder_app/pages/build_options/personal_info/componets/first_and_last_name_row.dart';
import 'package:resume_builder_app/pages/utills/heders_utills.dart';

Widget formWidget({
  required BuildContext context,
}) {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(16),
    decoration: const BoxDecoration(
        color: Color(0xff9DB2BF),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(offset: Offset(3, 3), color: Colors.grey, blurRadius: 10),
        ]),
    child: Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Name
            firstLastNameRow(),

            // e-mail
            Container(
              margin: const EdgeInsets.all(7),
              child: TextFormField(
                onSaved: (val) {
                  Globals.globals.email = val;
                },
                validator: (val) => val!.isEmpty
                    ? "Must enter email"
                    : RegExp(r'''^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$''')
                            .hasMatch(val)
                        ? null
                        : "Invalid email",
                initialValue: Globals.globals.email,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.mail),
                  hintText: "Enter email",
                  labelText: "Email",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            // phone number
            Container(
              margin: const EdgeInsets.all(7),
              child: TextFormField(
                onSaved: (val) {
                  Globals.globals.phone = val;
                },
                validator: (val) {
                  return val!.isEmpty
                      ? "Must enter contact"
                      : val.length < 10
                          ? "Contact must be of 10 digits"
                          : null;
                },
                textInputAction: TextInputAction.next,
                initialValue: Globals.globals.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                maxLength: 10,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  hintText: "Enter phone number",
                  labelText: "phone number",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            // Address
            Container(
              margin: const EdgeInsets.all(7),
              child: TextFormField(
                initialValue: Globals.globals.address,
                onSaved: (val) {
                  Globals.globals.address = val;
                },
                validator: (val) => val!.isEmpty ? "Must enter address" : null,
                onFieldSubmitted: (val) {
                  formKey.currentState!.validate();
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_on_sharp),
                  hintText: "Enter address",
                  labelText: "address",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    bool validated = formKey.currentState!.validate();

                    if (validated) {
                      // Save data of entire form
                      formKey.currentState!.save();
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          validated
                              ? "Form saved"
                              : "Failed to validate the form",
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: validated ? Colors.green : Colors.red,
                      ),
                    );
                  },
                  child: const Text("SAVE"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Globals.globals.reset();
                    formKey.currentState!.reset();
                  },
                  child: const Text("RESET"),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
