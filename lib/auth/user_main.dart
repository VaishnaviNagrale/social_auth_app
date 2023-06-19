import 'package:flutter/material.dart';
import 'package:social_auth_app/user/change_pass.dart';
import 'package:social_auth_app/user/dashbord.dart';
import 'package:social_auth_app/user/profile.dart';

class UserMain extends StatefulWidget {
  const UserMain({super.key});

  @override
  State<UserMain> createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  int selectedIndes = 0;
  static List<Widget> _widgetOption = [
    DashBoard(),
    Profile(),
    ChangePassword(),
  ];

  void _onItemTap(int index) {
    setState(() {
      selectedIndes = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(selectedIndes),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Change Password',
          ),
        ],
        currentIndex: selectedIndes,
        selectedItemColor: Colors.blue,
        onTap: _onItemTap,
      ),
    );
  }
}
