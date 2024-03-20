import 'dart:io';
import 'dart:typed_data';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfGenerator {
  static createPdf() async {
    String path = (await getApplicationDocumentsDirectory()).path;
    File file = File("${path}MY_PDF.pdf");

    Document pdf = Document();
    pdf.addPage(_createPage());

    Uint8List bytes = await pdf.save();
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }

  static Page _createPage() {
    return Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return Center(child: Container(child: Text('abdullah')));
        });
  }
}
