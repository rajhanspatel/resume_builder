import 'package:resume_builder_app/pages/utills/heders_utills.dart';

Widget firstLastNameRow() {
  return Row(
    children: [
      // FirstName
      Expanded(
        child: Container(
          margin: const EdgeInsets.all(7),
          child: TextFormField(
            //1
            onSaved: (val) {
              Globals.globals.firstName = val;
            },

            validator: (val) {
              if (val!.isEmpty) {
                return "Must enter first name";
              } else {
                return null;
              }
            },
            initialValue: Globals.globals.firstName,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              hintText: "Enter first name",
              labelText: "First Name",
              labelStyle: const TextStyle(
                color: Color(0xffDDE6ED),
              ),
              hintStyle: const TextStyle(
                color: Color(0xffDDE6ED),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
      // LastName
      Expanded(
        child: Container(
          margin: const EdgeInsets.all(7),
          child: TextFormField(
            //1
            onSaved: (val) {
              Globals.globals.lastName = val;
            },

            validator: (val) {
              if (val!.isEmpty) {
                return "Must enter last name";
              } else {
                return null;
              }
            },
            initialValue: Globals.globals.firstName,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              hintText: "Enter last name",
              labelText: "Last Name",
              labelStyle: const TextStyle(
                color: Color(0xffDDE6ED),
              ),
              hintStyle: const TextStyle(
                color: Color(0xffDDE6ED),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
