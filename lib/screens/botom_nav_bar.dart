import 'package:api_app_demo/screens/all_user_screen.dart';
import 'package:api_app_demo/screens/login_screen.dart';
import 'package:api_app_demo/screens/makeup_screen.dart';
import 'package:api_app_demo/screens/news_screen.dart';
import 'package:api_app_demo/screens/register_header.dart';
import 'package:api_app_demo/screens/sign_up_screen.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> screens = [
    AllUserScreen(),
    LoginScreen(),
    MakeupScreen(),
    NewsScreen(),
    RegisterPage(),
    SignUpScreen()
  ];
  int _currentIndex = 0;

  // @override
  // void initState() {
  //   initialization();
  //
  //   super.initState();
  // }

  // void initialization() async {
  //   // This is where you can initialize the resources needed by your app while
  //   // the splash screen is displayed.  Remove the following example because
  //   // delaying the user experience is a bad design practice!
  //   // ignore_for_file: avoid_print
  //   // print('ready in 3...');
  //   // await Future.delayed(const Duration(seconds: 1));
  //   print('ready in 2...');
  //   await Future.delayed(const Duration(seconds: 1));
  //   print('ready in 1...');
  //   await Future.delayed(const Duration(seconds: 1));
  //   print('go!');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: DotNavigationBar(
          paddingR: const EdgeInsets.symmetric(vertical: 0),
          margin: const EdgeInsets.only(left: 10, right: 10),
          curve: Curves.easeInCirc,
          currentIndex: _currentIndex,
          dotIndicatorColor: Colors.white,
          unselectedItemColor: Colors.grey[300],
          // enableFloatingNavBar: false,
          onTap: (index) {
            _currentIndex = index;
            setState(() {});
          },
          items: [
            /// Home
            DotNavigationBarItem(
              icon: const Icon(Icons.home),
              selectedColor: const Color(0xff73544C),
            ),

            /// Likes
            DotNavigationBarItem(
              icon: const Icon(Icons.category),
              selectedColor: const Color(0xff73544C),
            ),

            /// Search
            DotNavigationBarItem(
              icon: const Icon(Icons.remove),
              selectedColor: const Color(0xff73544C),
            ),

            /// Profile
            DotNavigationBarItem(
              icon: const Icon(Icons.invert_colors_sharp),
              selectedColor: const Color(0xff73544C),
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.satellite),
              selectedColor: const Color(0xff73544C),
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.storage),
              selectedColor: const Color(0xff73544C),
            ),
          ],
        ),
      ),
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
