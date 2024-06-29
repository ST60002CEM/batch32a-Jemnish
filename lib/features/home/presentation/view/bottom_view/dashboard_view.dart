import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  late bool isDark;
  @override
  void initState() {
    // isDark = ref.read(isDarkThemeProvider);
    isDark = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard View'),
        ),
        body: const Center(
          child: Text('Dashboard Screen'),
        ));
  }
}
