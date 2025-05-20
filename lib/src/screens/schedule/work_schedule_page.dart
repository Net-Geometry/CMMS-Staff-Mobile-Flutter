import 'package:flutter/material.dart';

class WorkSchedulePage extends StatelessWidget {
  const WorkSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 5×7 grid data for April 2025 (1st is a Tuesday)
    final days = <int?>[
      null, null, 1, 2, 3, 4, 5,
      6, 7, 8, 9, 10, 11, 12,
      13, 14, 15, 16, 17, 18, 19,
      20, 21, 22, 23, 24, 25, 26,
      27, 28, 29, 30, null, null, null,
    ];

    // Example color mapping by day
    final eventColors = <int, Color>{
      2: Colors.blue,    // Medical Leave
      3: Colors.blue,
      14: Colors.amber,  // Annual Leave
      15: Colors.amber,
      23: Colors.pink,   // Replacement Leave
      24: Colors.pink,
      11: Colors.green,  // Public Holiday
      // Off-days
      6: Colors.black,
      5: Colors.black,
      13: Colors.black,
      19: Colors.black,
      20: Colors.black,
      27: Colors.black,
      // Manager off-day
      26: Colors.grey,
    };

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 16),
          // Calendar Card
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Month header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.chevron_left),
                      Text('April 2025',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Weekday labels
                  Row(
                    children: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
                        .map((d) => Expanded(
                            child: Center(
                                child:
                                    Text(d, style: TextStyle(color: Colors.grey)))))
                        .toList(),
                  ),
                  const SizedBox(height: 8),
                  // 5 rows of days
                  Column(
                    children: List.generate(5, (row) {
                      return Row(
                        children: List.generate(7, (col) {
                          final day = days[row * 7 + col];
                          return Expanded(
                            child: SizedBox(
                              height: 40,
                              child: day == null
                                  ? const SizedBox()
                                  : _DayCell(
                                      day: day,
                                      isSelected: day == 8, // highlight 8th
                                      underlineColor: eventColors[day],
                                    ),
                            ),
                          );
                        }),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Legend
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Legend',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  children: const [
                    _LegendItem(color: Colors.blue, label: 'Medical Leave'),
                    _LegendItem(color: Colors.amber, label: 'Annual Leave'),
                    _LegendItem(color: Colors.pink, label: 'Replacement Leave'),
                    _LegendItem(color: Colors.grey, label: 'Manager\'s Off Day'),
                    _LegendItem(color: Colors.black, label: 'Assistant Manager\'s Off-Day'),
                    _LegendItem(color: Colors.green, label: 'Public Holiday'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DayCell extends StatelessWidget {
  final int day;
  final bool isSelected;
  final Color? underlineColor;

  const _DayCell({
    required this.day,
    this.isSelected = false,
    this.underlineColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isSelected)
          Container(
            width: 32,
            height: 32,
            decoration:
                const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          ),
        Text(
          '$day',
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        if (underlineColor != null)
          Positioned(
            bottom: 6,
            child: Container(
              width: 24,
              height: 4,
              color: underlineColor,
            ),
          ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendItem({required this.color, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
      const SizedBox(width: 6),
      Text(label),
    ]);
  }
}
