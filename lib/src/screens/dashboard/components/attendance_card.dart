import 'package:cmms_staff_mobile_flutter/src/theme/color.dart';
import 'package:flutter/material.dart';

import '../../../theme/text.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Attendance",
                    ).titleMedium.semiBold.withColor(AppColor.black),
                    const SizedBox(height: 4),
                    const Text(
                      "23 April, 2025",
                    ).labelLarge.withColor(AppColor.slateGray),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      AppColor.mintGreen,
                    ),
                  ),
                  child: Text("Clocked In").labelLarge,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Clock In Time").labelLarge.withColor(AppColor.slateGray),
                    const Text("08:30 AM").bodyLarge.withColor(AppColor.black).semiBold,
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppColor.primary),
                  ),
                  child: Text("Clock Out").labelLarge.withColor(AppColor.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
