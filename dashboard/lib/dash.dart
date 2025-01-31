import 'package:dashboard/right.dart';
import 'package:flutter/material.dart';

import 'left.dart';
import 'mid.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5FA),
      body: Row(
        children: [
          SideMenu(),
          Expanded(child: DashboardContent()),
          RightPannel(),
        ],
      ),
    );
  }
}