import 'package:demo_connect/resources/pages.dart';
import 'package:flutter/material.dart';

class TestHomeScreen extends StatefulWidget {
  const TestHomeScreen({super.key});

  @override
  State<TestHomeScreen> createState() => _TestHomeScreenState();
}

class _TestHomeScreenState extends State<TestHomeScreen> {

  int _selectItem = 0;
  var _pages = [FirstPage(), SecondPage(), ThirdPage()];
  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectItem = index;
          });
        },
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.style_outlined,
            ),
            label: 'Internships',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.style_outlined,
            ),
            label: 'Placements',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.style_outlined,
            ),
            label: 'More',
          ),
        ],
        currentIndex: _selectItem,
        onTap: (index) {
          setState(() {
            _selectItem = index;
            _pageController.animateToPage(_selectItem, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          });
        },
      ),
    );
  }
}
