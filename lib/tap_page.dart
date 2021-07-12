import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/account_page.dart';
import 'package:flutter_app/home_page.dart';
import 'package:flutter_app/search_page.dart';

//Life Cycle
// 1. stateless : Constructor -> Build()
// 2. statefull : Constructor -> CreateState -> initState(), Context사용불가 -> didChangeDependencies -> Build() -> dispose() 메모리 릭 방지
//                setState -> Build()
//                부모 위젯으로부터 변화 -> didUpdateWidget() -> Build()

class TabPage extends StatefulWidget {
  final User user;

  const TabPage(this.user, {Key key}) : super(key: key);
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  List _pages;

  @override
  void initState() {
    _pages = [
      HomePage(widget.user),
      SearchPage(widget.user),
      AccountPage(widget.user),
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child : _pages[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search",),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account",)
        ]),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
