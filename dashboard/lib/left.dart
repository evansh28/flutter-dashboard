import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class SideMenu extends StatefulWidget {
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int selectedIndex = -1;

  void selectMenuItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage("assets/images/logo.png"),
                width: 70,
                height: 70,
              ),
            ),
            Divider(),
            CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/profile.jpg")),
            SizedBox(height: 10),
            Text("Pooja Mishra",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold)),
            Text("Admin", style: GoogleFonts.poppins(color: Colors.grey)),
            Divider(),
            SizedBox(height: 20),
            DrawerItem(
              index: 0,
              title: "Home",
              icon: Icons.home,
              isSelected: selectedIndex == 0,
              onSelect: () => selectMenuItem(0),
            ),
            DrawerItem(
              index: 1,
              title: "Employees",
              icon: Icons.people,
              isSelected: selectedIndex == 1,
              onSelect: () => selectMenuItem(1),
            ),
            DrawerItem(
              index: 2,
              title: "Attendance",
              icon: Icons.access_time,
              isSelected: selectedIndex == 2,
              onSelect: () => selectMenuItem(2),
            ),
            DrawerItem(
              index: 3,
              title: "Summary",
              icon: Icons.bar_chart,
              isSelected: selectedIndex == 3,
              onSelect: () => selectMenuItem(3),
            ),
            DrawerItem(
              index: 4,
              title: "Information",
              icon: Icons.info,
              isSelected: selectedIndex == 4,
              onSelect: () => selectMenuItem(4),
            ),
            Divider(),
            DropItem(title: "Abstract", icon: Icons.arrow_drop_down),
            DropItem(title: "Finance", icon: Icons.arrow_drop_down),
            SizedBox(height: 20),
            Setting(title: "Setting", icon: Icons.settings),
            Setting(title: "Logout", icon: Icons.logout)
          ],
        ),
      ),
    );
  }
}

class Setting extends StatelessWidget {
  final String title;
  final IconData icon;

  Setting({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title, style: GoogleFonts.poppins(fontSize: 14)),
      onTap: () {},
    );
  }
}

class DropItem extends StatelessWidget {
  final String title;
  final IconData icon;

  DropItem({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(icon, color: Colors.black54),
      title: Text(title, style: GoogleFonts.poppins(fontSize: 14)),
      onTap: () {},
    );
  }
}

class DrawerItem extends StatelessWidget {
  final int index;
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onSelect;

  DrawerItem({
    required this.index,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.black : Colors.black54,
        size: isSelected ? 22 : 20,
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: isSelected ? 17 : 15,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onSelect,
    );
  }
}