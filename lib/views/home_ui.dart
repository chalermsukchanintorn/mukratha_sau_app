import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mukratha_sau_app/views/about_ui.dart';
import 'package:mukratha_sau_app/views/cal_bill_ui.dart';
import 'package:mukratha_sau_app/views/menu_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  //สร้างตัวควบุคม AnimatedNotchBottomBar
  NotchBottomBarController _pageController = NotchBottomBarController(index: 1);

  //สร้างตัวแปรเก็บหน้าจอที่จะแสดงที่ body ซึ่งล้อกับ AnimatedNotchBottomBar
  List<Widget> viewInBody = [
    CalBillUI(),
    MenuUI(),
    AboutUI(),
  ];

  //สร้างตัวแปรเก็บ index ของหน้าที่จะแสดงที่ body
  int indexShow = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Tech SAU FUFFET',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        onTap: (valueParam) {
          setState(() {
            indexShow = valueParam;
          });
        },
        kIconSize: 24.0,
        kBottomRadius: 28.0,
        notchColor: Colors.deepOrange,
        color: Colors.deepOrange,
        notchBottomBarController: _pageController,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: const Color.fromARGB(255, 191, 191, 191),
            ),
            activeItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.white,
            ),
            itemLabel: 'คิดเงิน',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home,
              color: const Color.fromARGB(255, 191, 191, 191),
            ),
            activeItem: Icon(
              Icons.home,
              color: Colors.white,
            ),
            itemLabel: 'MENU',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.star,
              color: const Color.fromARGB(255, 191, 191, 191),
            ),
            activeItem: Icon(
              Icons.star,
              color: Colors.white,
            ),
            itemLabel: 'เกี่ยวกับ',
          ),
        ],
      ),
      body: viewInBody[indexShow],
    );
  }
}
