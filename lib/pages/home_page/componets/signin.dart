import 'package:resume_builder_2/pages/utills/heders_utills.dart';

Container signInCard({required Size size}) {
  return Container(
    height: size.height * 0.25,
    width: double.infinity,
    decoration: BoxDecoration(
      color: const Color(0xff9DB2BF),
      borderRadius: BorderRadius.circular(16.0),
      boxShadow: const [
        BoxShadow(
          offset: Offset(3, 3),
          blurRadius: 10,
          color: Colors.grey,
        )
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
//Title
          const Text(
            'Sign in to your free account',
            style: TextStyle(
                // color: Color(0xff506b7b),
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
//Description
          const Text(
            'Your guest account will be deleted after 3 days '
            'so, sign in to your account & get extra benefits.',
            style: TextStyle(),
          ),
//Button
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffDDE6ED),
              ),
              onPressed: () {},
              child: const Text(
                'Sign In Now',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
