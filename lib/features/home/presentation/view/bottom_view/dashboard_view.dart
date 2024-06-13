import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:student_management_starter/features/home/presentation/widget/my_snackbar.dart';

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
          actions: [
            IconButton(
              onPressed: () {
                // ref.read(batchViewModelProvider.notifier).getBatches();
                // ref.read(courseViewModelProvider.notifier).getCourses();
                showMySnackBar(message: 'Refressing...');
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                ref.read(homeViewModelProvider.notifier).logout();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            Switch(
                value: isDark,
                onChanged: (value) {
                  setState(() {
                    isDark = value;
                    // ref.read(isDarkThemeProvider.notifier).updateTheme(value);
                  });
                }),
          ],
        ),
        body: const Center(
          child: Text('Dashboard Screen'),
        ));
  }
}
