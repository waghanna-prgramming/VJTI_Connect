import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReader extends StatefulWidget {
  final String pdfLink;

  const PdfReader({required this.pdfLink});

  @override
  State<PdfReader> createState() => _PdfReaderState();
}

class _PdfReaderState extends State<PdfReader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.network(widget.pdfLink),
    );
  }
}
