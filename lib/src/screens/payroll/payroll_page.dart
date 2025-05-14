import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pdfx/pdfx.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'payslip_detail_page.dart';


class PayrollPage extends StatelessWidget {
  const PayrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: _buildDropdown("Month")),
                const SizedBox(width: 12),
                Expanded(child: _buildDropdown("2025")),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildMonthHeader("April 2025", isSelected: true),
                  _buildPayslipCard(context, "April 2025", "Processed on Apr 25", "https://example.com/payslip-apr25.pdf"),
                  _buildMonthHeader("March 2025"),
                  _buildPayslipCard(context, "March 2025", "Processed on Mar 25", "https://example.com/payslip-mar25.pdf"),
                  _buildMonthHeader("February 2025"),
                  _buildPayslipCard(context, "February 2025", "Processed on Feb 25", "https://example.com/payslip-feb25.pdf"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String value) {
    return DropdownButtonFormField<String>(
      value: value,
      items: [value].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: (val) {},
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }

  Widget _buildMonthHeader(String month, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: const Color(0xFF00A572),
                borderRadius: BorderRadius.circular(8),
              )
            : null,
        child: Text(
          month,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildPayslipCard(BuildContext context, String title, String date, String pdfUrl) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.receipt_long, color: Color(0xFF00A572)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(date),
        trailing: IconButton(
          icon: const Icon(Icons.download, color: Color(0xFF00A572)),
          onPressed: () async {
            final uri = Uri.parse(pdfUrl);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Could not launch file")),
              );
            }
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PayslipDetailPage(
                title: "April 2025",
                date: "Processed on Apr 25",
                pdfUrl: "https://example.com/payslip-apr25.pdf",
              ),
            ),
          );
        },
      ),
    );
  }
}
