import 'package:flutter/material.dart';
import 'package:solution_challenge/mths3.dart';
import 'package:solution_challenge/myths.dart';
import 'package:solution_challenge/myths1.dart';
import 'package:solution_challenge/myths2.dart';

class Onboarding1 extends StatelessWidget {

  List<Tab> tabs = [
    Tab(child: Text("General")),
    Tab(child: Text("Straight")),
    Tab(child: Text("Gay")),
    Tab(child: Text("Lesbian")),
  ];

  List<Widget> tabsContent = [
   myths(),
    myths1(),
    myths2(),
    myths3()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[200],
          centerTitle: true,
          brightness: Brightness.dark,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(2),
            child: TabBar(
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: tabs,
            ),
          ),
        ),
        body: TabBarView(
          children: tabsContent,
        ),
      ),
    );
  }
}