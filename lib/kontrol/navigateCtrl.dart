import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_cash_id/pages/adminProfil.dart';
import 'package:note_cash_id/pages/beranda.dart';
import 'package:note_cash_id/pages/screens/fromInputData.dart';

class NavigationViewController extends StatefulWidget {
  const NavigationViewController({super.key});

  @override
  State<NavigationViewController> createState() =>
      _NavigationViewControllerState();
}

class _NavigationViewControllerState extends State<NavigationViewController> {
  int currentPage = 0;
  final List<Widget> pages = [
    const BerandaPage(),
    const ProfilAdminPage(),
  ];

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.home,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.solidCircleUser,
      ),
      label: 'Akun',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: builPage()),
      bottomNavigationBar: navigateBottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: ClipRRect(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FromInputDataBarang(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.shade700,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: CircleAvatar(
                    radius: 35.0,
                    foregroundColor: Colors.blueGrey.shade400,
                    backgroundColor: Colors.lightBlue.shade900,
                    child: const Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.white,
                      size: 35.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  Widget builPage() => ClipRRect(
        child: IndexedStack(
          index: currentPage,
          children: pages,
        ),
      );

  navigateBottom() => BottomNavigationBar(
        currentIndex: currentPage,
        selectedItemColor: Colors.lightBlueAccent,
        items: items,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
      );
}
