import 'package:flutter/material.dart';

class LeaveManagementPage extends StatelessWidget {
  const LeaveManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildLeaveBalanceCard(),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00A572),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('+ Apply Leave'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF00A572),
                      side: const BorderSide(color: Color(0xFF00A572)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Apply RL'),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Pending Leave Requests', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Chip(label: Text('All')),
                    SizedBox(width: 6),
                    Chip(label: Text('Replacement')),
                  ],
                )
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  _buildLeaveCard('Annual Leave', 'May 4-7', '3 days', 'Rejected', Colors.red.shade100, Colors.red.shade800),
                  _buildLeaveCard('Medical Leave', 'Apr 2-3', '2 days', 'Approved', Colors.green.shade100, Colors.green.shade800),
                  _buildLeaveCard('Replacement Leave', 'Apr 23-24', '2 days', 'Pending', Colors.orange.shade100, Colors.orange.shade800),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLeaveBalanceCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Leave Balance', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('2025'),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _LeaveStat(count: '12/12', label: 'Annual'),
                _LeaveStat(count: '3/5', label: 'Medical'),
                _LeaveStat(count: '2/3', label: 'Replacement'),
                _LeaveStat(count: '2/2', label: 'Emergency'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLeaveCard(String type, String range, String duration, String status, Color bgColor, Color textColor) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(type, style: const TextStyle(fontWeight: FontWeight.bold)),
                _buildStatusTag(status, bgColor, textColor)
              ],
            ),
            const SizedBox(height: 8),
            Text(range),
            Text(duration, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('View Details'),
              ),
            )
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

class _LeaveStat extends StatelessWidget {
  final String count;
  final String label;

  const _LeaveStat({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: const TextStyle(color: Colors.grey))
      ],
    );
  }
}