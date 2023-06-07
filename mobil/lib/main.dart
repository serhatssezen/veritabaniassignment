import 'package:assignment/di/service_locator.dart';
import 'package:assignment/pages/cart.dart';
import 'package:assignment/pages/explore.dart';
import 'package:assignment/pages/profile.dart';
import 'package:assignment/pages/search.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _selectedPage = 0;

  List<Widget> pages = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    pages = [
      ExplorePage(callBack: _onItemTapped),
      const SearchPage(),
      const CartPage()
    ];
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) => setState(() { _selectedPage = index; }),
        controller: _pageController,
        children: [
          ...pages
        ],
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedPage,
        showElevation: false,
        onItemSelected: (index) => _onItemTapped(index),
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.home_outlined, size: 23),
            title: const Text('Ana Sayfa'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.search, size: 23),
            title: const Text('Arama'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.shopping_bag_outlined, size: 23),
            title: const Text('Sepet'),
          )
        ],
      ),
    );
  }
}
