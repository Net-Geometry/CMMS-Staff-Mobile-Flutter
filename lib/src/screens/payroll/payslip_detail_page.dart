import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pdfx/pdfx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class PayslipDetailPage extends StatelessWidget {
  final String title;
  final String date;
  final String pdfUrl;

  const PayslipDetailPage({
    super.key,
    required this.title,
    required this.date,
    required this.pdfUrl,
  });

  Future<PdfDocument> _loadPdf() async {
    final bytes = await http.readBytes(Uri.parse(pdfUrl));
    return PdfDocument.openData(bytes);
  }

  Future<void> _sharePdf(BuildContext context) async {
    try {
      final response = await http.get(Uri.parse(pdfUrl));
      final bytes = response.bodyBytes;
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/$title.pdf');
      await file.writeAsBytes(bytes);
      await Share.shareXFiles([XFile(file.path)], text: '$title Payslip');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to share PDF: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _sharePdf(context),
          ),
        ],
      ),
      body: FutureBuilder<PdfDocument>(
        future: _loadPdf(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text('Failed to load PDF'));
          }

          final controller = PdfControllerPinch(document: Future.value(snapshot.data!),);
          return PdfViewPinch(controller: controller);
        },
      ),
    );
  }
}
