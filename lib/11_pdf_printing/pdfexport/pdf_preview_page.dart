import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pratical_challenge/11_pdf_printing/pdfexport/pdfexport.dart';
import 'package:printing/printing.dart';

import '../pdf_printing.dart';

class PdfPreviewPage extends StatelessWidget {
  final Invoice invoice;
  const PdfPreviewPage({Key? key, required this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(invoice),
        canChangePageFormat: false,
        canDebug: false,
      ),
    );
  }
}
