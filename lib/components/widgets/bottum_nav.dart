import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:event_management_system/pages/booking.dart';
import 'package:event_management_system/pages/home.dart';
import 'package:event_management_system/pages/profile.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late List<Widget> _pages;
  late Home home;
  late Booking booking;
  late Profile profile;
  int currentTabInsex = 0;

  @override
  void initState() {
    super.initState();
    home = const Home();
    booking = const Booking();
    profile = const Profile();
    _pages = [home, booking, profile];
  }
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.blue,
        buttonBackgroundColor: Colors.white,
        height: 60,
        animationDuration: Duration(milliseconds: 300),
        index: 0,
        onTap: (index) {
          setState(() {
            currentTabInsex = index;
          });
        },
        items: [
          Icon(Icons.home_filled, size: 30, color: Colors.blue),
          Icon(Icons.book_outlined, size: 30, color: Colors.blue),
          Icon(Icons.person, size: 30, color: Colors.blue),
        ],),
        body: _pages[currentTabInsex], // Default to the first page
    );
  }
}