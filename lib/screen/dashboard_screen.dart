import 'package:flutter/material.dart';

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
      const Center(child: Text('DashBoard')),
      const Center(child: Text('NewsFeed')),
      const Center(child: Text('MarketPlace')),
      const Center(child: Text('Profile')),
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
          title: const Text('Khet Pati', textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: const Icon(Icons.notifications),
            ),
            InkWell(
              onTap: () {
                // Handle button tap
              },
              child: Image.asset(
                'assets/images/profile.png', // Replace with your image path
                width: 21,
                height: 21,
              ),
            )
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
          fixedColor: Colors.green[600],
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
