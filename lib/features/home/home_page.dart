import 'package:boilerplate/core/keys/app_keys.dart';
import 'package:boilerplate/core/spacings/app_spacing.dart';
import 'package:boilerplate/features/message/message_page.dart';
import 'package:boilerplate/features/shop/shop_page.dart';
import 'package:boilerplate/features/tinder/tinder_page.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:boilerplate/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key(WidgetKeys.homeScaffoldKey),
      appBar: AppBar(
        title: Text(S.of(context).home),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text(S.of(context).setting),
              onPressed: () {
                context.push(AppRouter.settingPath);
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy Loading with PageView'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          MessagePage(),
          ShopPage(),
          TinderPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Tinder',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
