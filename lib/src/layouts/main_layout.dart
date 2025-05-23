import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/navbar.dart';
import '../widgets/topbar.dart';
import '../providers/navigation_provider.dart';

class MainLayout extends ConsumerWidget {
  final List<Widget> pages;

  const MainLayout({super.key, required this.pages});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          TopBar(
            // profileImageUrl: null,
            onNotificationTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Notification tapped")),
              );
            },
          ),
          Expanded(child: pages[selectedIndex]),
        ],
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: selectedIndex,
        onTabSelected: (index) => ref.read(navigationProvider.notifier).setIndex(index),
      ),
      floatingActionButton: NavBar.buildFloatingActionButton(
        context,
        selectedIndex,
        (index) => ref.read(navigationProvider.notifier).setIndex(index),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
