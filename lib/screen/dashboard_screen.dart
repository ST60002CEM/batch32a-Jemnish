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
      const Text('Tab2'),
      const Text('Tab3'),
      const Text('Tab4'),
      const Text('Tab5'),
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
          title: const Text('Fryo', textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: const Icon(Icons.menu),
            ),
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: const Icon(Icons.menu),
            )
          ],
        ),
        body: tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favourites',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
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
