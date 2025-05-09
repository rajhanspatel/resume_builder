import 'package:printing/printing.dart';
import 'package:resume_builder_app/pages/utills/heders_utills.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

//
// class PdfPage extends StatefulWidget {
//   const PdfPage({super.key});
//
//   @override
//   State<PdfPage> createState() => _PdfPageState();
// }
//
// class _PdfPageState extends State<PdfPage> {
//   pw.TextStyle nameStyle =
//       pw.TextStyle(fontSize: 52, fontWeight: pw.FontWeight.bold);
//   Future<Uint8List> getPdf({required Size size}) async {
//     //----------------------------------------------------------------
//     pw.Document pdf = pw.Document();
//     //---------------------------------------------------------------
//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) => pw.Column(
//           children: [
//             pw.SizedBox(
//               height: size.height * 0.01,
//             ),
//             pw.Container(
//               color: PdfColors.grey,
//               // Profile ---------------------------------------
//               child: pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   // Profile Image ----------------------------------
//                   pw.ClipOval(
//                     child: pw.Container(
//                       height: 150,
//                       width: 150,
//                       decoration: pw.BoxDecoration(
//                         color: PdfColors.blue,
//                         image: pw.DecorationImage(
//                           image: pw.MemoryImage(
//                               Globals.globals.image!.readAsBytesSync()),
//                         ),
//                       ),
//                     ),
//                   ),
//                   //FirstName ---------------------------------------
//                   pw.Text(
//                     Globals.globals.firstName.toString().replaceFirst(
//                         Globals.globals.firstName.toString()[0],
//                         Globals.globals.firstName.toString()[0].toUpperCase()),
//                     style: nameStyle,
//                   ),
//                   //LastName ----------------------------------------
//                   pw.Text(
//                       " ${Globals.globals.lastName.toString().replaceFirst(Globals.globals.lastName.toString()[0], Globals.globals.lastName.toString()[0].toUpperCase())}",
//                       style: nameStyle),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//     //---------------------------------------------------------------
//     return pdf.save();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.sizeOf(context);
//     return Scaffold(
//       appBar: appBar(
//           opTap: () {
//             Navigator.of(context).pop();
//           },
//           msj: "PDF",
//           context: context),
//       body: PdfPreview(
//         build: (PdfPageFormat format) => getPdf(size: size),
//       ),
//     );
//   }
// }
class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  Future<Uint8List> loadPdf() async {
    //1. Create Object
    pw.Document doc = pw.Document();
    ByteData byteData = await rootBundle.load("lib/assets/images/profile.jpg");
    //2. Design Pdf
    doc.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Container(
                height: 150,
                width: double.infinity,
                color: PdfColors.grey,
                child: pw.Row(
                  children: [
                    pw.Container(
                      height: 120,
                      width: 120,
                      margin: const pw.EdgeInsets.all(15),
                      decoration: pw.BoxDecoration(
                        color: PdfColors.white,
                        borderRadius: const pw.BorderRadius.all(
                          pw.Radius.circular(60),
                        ),
                        image: pw.DecorationImage(
                          image: pw.MemoryImage(
                            (Globals.globals.image != null)
                                ? Globals.globals.image!.readAsBytesSync()
                                : byteData.buffer.asUint8List(),
                          ),
                          fit: pw.BoxFit.cover,
                        ),
                      ),
                    ),
                    pw.SizedBox(width: 50),
                    pw.Text(
                      "${Globals.globals.firstName} ${Globals.globals.lastName}",
                      style: pw.TextStyle(
                        fontSize: 28,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 30),
              pw.Row(
                // mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
//Left Side
                  pw.Container(
                    height: 548,
                    width: 190,
                    // color: PdfColors.grey,
                    child: pw.Column(
                      children: [
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            'CONTACT',
                            style: pw.TextStyle(
                              fontSize: 19,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            Globals.globals.phone.toString(),
                            style: const pw.TextStyle(
                              fontSize: 18,
                            ),
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                        pw.Text(
                          Globals.globals.email.toString(),
                          style: const pw.TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        pw.Text(
                          Globals.globals.address.toString(),
                          style: const pw.TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Divider(),
                        pw.SizedBox(height: 10),
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            'ABOUT ME',
                            style: pw.TextStyle(
                              fontSize: 19,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          'A multitasking, adaptable individual '
                          'with a passion for work, gaming, travelling, '
                          '& Flutter development. ',
                          style: const pw.TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Divider(),
                        pw.SizedBox(height: 10),
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            'TECHNICAL SKILLS',
                            style: pw.TextStyle(
                              fontSize: 19,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        ...List.generate(
                          Globals.controller.length,
                          (index) => pw.Align(
                            alignment: pw.Alignment.centerLeft,
                            child: pw.Text(
                              '- ${Globals.controller[index].text}',
                              style: const pw.TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        // pw.Text()
                      ],
                    ),
                  ),
                  pw.Container(
                    width: 50,
                    // color: PdfColors.black,
                    // child: pw.Transform.rotate(
                    //   angle: pi / 2,
                    //   child: pw.Divider(
                    //     indent: 0,
                    //   ),
                    // ),
                  ),
//Right Side
                  pw.Container(
                    // alignment: pw.Alignment.centerRight,
                    height: 548,
                    width: 280,
                    // color: PdfColors.grey,
                    child: pw.Column(
                      children: [
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            'EDUCATION',
                            style: pw.TextStyle(
                              fontSize: 18,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            '\t\t\t- ${Globals.globals.degree}',
                            style: pw.TextStyle(
                              fontSize: 17,
                              fontWeight: pw.FontWeight.bold,
                            ),
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            '\t\t\t  ${Globals.globals.clg} - ${Globals.globals.year}',
                            style: const pw.TextStyle(
                              fontSize: 17,
                            ),
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            '\t\t\t- HSC (Science / 57%)',
                            style: pw.TextStyle(
                              fontSize: 17,
                              fontWeight: pw.FontWeight.bold,
                            ),
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            '\t\t\t  Ankur Vidhyabhavan - March \n'
                            '\t\t\t  2022-23',
                            style: const pw.TextStyle(
                              fontSize: 17,
                            ),
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            '\t\t\t- SSC (91%)',
                            style: pw.TextStyle(
                              fontSize: 17,
                              fontWeight: pw.FontWeight.bold,
                            ),
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            '\t\t\t  Hansvahini Highschool - March \n'
                            '\t\t\t  2020-21',
                            style: const pw.TextStyle(
                              fontSize: 17,
                            ),
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            'CERTIFICATE COURSES',
                            style: pw.TextStyle(
                              fontSize: 19,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            '\t\t\t- Master In Flutter',
                            style: pw.TextStyle(
                              fontSize: 17,
                              fontWeight: pw.FontWeight.bold,
                            ),
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            '\t\t\t  Red & White Multimedia\n'
                            '\t\t\t  Education , 2023-24',
                            style: const pw.TextStyle(
                              fontSize: 17,
                            ),
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Divider(),
                        pw.SizedBox(height: 10),
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            'WORK HISTORY',
                            style: pw.TextStyle(
                              fontSize: 19,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            '\t\t\t  E-Commerce App',
                            style: pw.TextStyle(
                              fontSize: 17,
                              fontWeight: pw.FontWeight.bold,
                            ),
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                        pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(
                            '\t\t\t\t\t\t- Products\n'
                            '\t\t\t\t\t\t- Filter Option\n'
                            '\t\t\t\t\t\t- Products Details\n'
                            '\t\t\t\t\t\t- Add To Cart\n'
                            '\t\t\t\t\t\t- Remove To cart\n'
                            '\t\t\t\t\t\t- Quantity & Price\n',
                            style: const pw.TextStyle(
                              fontSize: 17,
                            ),
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
    //3. Convert into Uint8List
    return doc.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          opTap: () => Navigator.pop(context),
          msj: "PDF Page",
          context: context),
      body: PdfPreview(
        pdfFileName:
            'RESUME_${"${Globals.globals.firstName} ${Globals.globals.lastName}"}.pdf',
        build: (format) => loadPdf(),
      ),
    );
  }
}
