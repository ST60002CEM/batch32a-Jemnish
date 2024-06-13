
import 'package:flutter/material.dart';
import 'package:kheti_pati/screen/bottom_screens/homepage_screen.dart';
import 'package:kheti_pati/screen/bottom_screens/marketplace_screen.dart';
import 'package:kheti_pati/screen/bottom_screens/newsfeed_screen.dart';
import 'package:kheti_pati/screen/bottom_screens/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      const HomePageScreen(),
      const NewsFeedScreen(),
      const MarketPlaceScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 212, 228, 212),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              iconSize: 21,
              icon: const Icon(Icons.menu, color: Colors.black87)),
          backgroundColor: const Color.fromARGB(255, 212, 228, 212),
          title: Image.asset('assets/images/profiles.png', height: 30),
          actions: <Widget>[
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: const Icon(Icons.notifications),
            ),
            InkWell(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ))
          ],
        ),
        body: tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'DashBoard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.abc_sharp),
              label: 'NewsFeed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.rss_feed),
              label: 'MarketPlace',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: const Color(0xFF18B5A3),
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
