import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StaffAttendanceHistoryPage extends StatelessWidget {
  const StaffAttendanceHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('MMMM dd, yyyy');

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(child: _buildDatePickerField("Start Date")),
                const SizedBox(width: 12),
                Expanded(child: _buildDatePickerField("End Date")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(child: _buildDropdown("Today")),
                const SizedBox(width: 12),
                Expanded(child: _buildDropdown("Present")),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildSectionLabel("Today"),
                _buildAttendanceCard(date: "April 23, 2025", checkIn: "09:00 AM", checkOut: "05:32 PM", duration: "8h 32m"),
                _buildSectionLabel("Yesterday"),
                _buildAttendanceCard(date: "April 22, 2025", checkIn: "08:55 AM", checkOut: "05:00 PM", duration: "8h 05m"),
                _buildSectionLabel("Earlier"),
                _buildAttendanceCard(date: "April 21, 2025", checkIn: "09:05 AM", checkOut: "05:15 PM", duration: "8h 10m"),
                _buildAbsentCard("April 20, 2025"),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.login, size: 20),
                    label: const Text("Clock In"),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00A572),
                      minimumSize: const Size.fromHeight(48),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.logout, size: 20),
                    label: const Text("Clock Out"),
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                      foregroundColor: Colors.grey,
                      minimumSize: const Size.fromHeight(48),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDatePickerField(String label) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.calendar_today),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildDropdown(String label) {
    return DropdownButtonFormField<String>(
      value: label,
      items: [label].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: (val) {},
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildAttendanceCard({required String date, required String checkIn, required String checkOut, required String duration}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
                _buildStatusTag("Present", Colors.green.shade100, Colors.green.shade800),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.login, size: 16, color: Colors.green),
                const SizedBox(width: 6),
                Text(checkIn),
                const SizedBox(width: 16),
                const Icon(Icons.logout, size: 16, color: Colors.green),
                const SizedBox(width: 6),
                Text(checkOut),
                const SizedBox(width: 16),
                const Icon(Icons.access_time, size: 16, color: Colors.green),
                const SizedBox(width: 6),
                Text(duration),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAbsentCard(String date) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Icon(Icons.info_outline, size: 16, color: Colors.grey),
                    SizedBox(width: 6),
                    Text("No attendance record")
                  ],
                ),
              ],
            ),
            _buildStatusTag("Absent", Colors.red.shade100, Colors.red.shade800),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusTag(String label, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }
}
