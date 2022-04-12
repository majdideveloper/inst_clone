import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instg_app/models/user.dart';
import 'package:instg_app/providers/user_provider.dart';
import 'package:instg_app/utils/colors.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  late PageController pageController;
  int _page = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          Center(
            child: Text('home'),
          ),
          Center(
            child: Text('home'),
          ),
          Center(
            child: Text('home'),
          ),
          Center(
            child: Text('home'),
          ),
          Center(
            child: Text('home'),
          ),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: navigationTapped,
        backgroundColor: mobileBackgroundColor,
        activeColor: primaryColor,
        inactiveColor: secondaryColor,
        currentIndex: _page,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
}
