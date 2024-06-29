import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/features/home/presentation/view/bottom_view/add_product_view.dart';
import 'package:kheti_pati/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:kheti_pati/features/home/presentation/view/bottom_view/news_feed_view.dart';
import 'package:kheti_pati/features/home/presentation/view/bottom_view/profile_view.dart';
import 'package:kheti_pati/features/product/presentation/view/product_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int selectedIndex = 0;
  List<Widget> lstScreen = [
    const DashboardView(),
    const ProductView(),
    const AddProductView(),
    const NewsFeedView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              selectedIndex = 2;
            });
          },
          elevation: 0,
          shape: const CircleBorder(),
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.add,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: lstScreen[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: 70,
        color: Colors.green,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
              icon: const Icon(Icons.dashboard),
              color: selectedIndex == 0 ? Colors.white : Colors.grey.shade400,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              icon: const Icon(Icons.book),
              color: selectedIndex == 1 ? Colors.white : Colors.grey.shade400,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 3;
                });
              },
              icon: const Icon(Icons.batch_prediction),
              color: selectedIndex == 3 ? Colors.white : Colors.grey.shade400,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 4;
                });
              },
              icon: const Icon(Icons.person),
              color: selectedIndex == 4 ? Colors.white : Colors.grey.shade400,
            ),
          ],
        ),
        // items: const [
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.dashboard),
        //     label: 'Dashboard',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.book),
        //     label: 'Product',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.batch_prediction),
        //     label: 'NewsFeed',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.person),
        //     label: 'Profile',
        //   ),
        // ],
        // currentIndex: selectedIndex,
        // onTap: (index) {
        //   setState(() {
        //     selectedIndex = index;
        //   });
        // },
      ),
    );
  }
}
