import 'package:flutter/material.dart';

class RightPannel extends StatefulWidget {
  const RightPannel({super.key});

  @override
  State<RightPannel> createState() => _RightPannelState();
}

class _RightPannelState extends State<RightPannel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 300,
            padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.sticky_note_2_outlined)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.power_settings_new)),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/avatar.jpg"),
              ),
            ],
          ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: 300,
              color: Color(0xFF10194E),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section
                    Text(
                      "GENERAL 10:00 AM TO 7:00 PM",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    // Calendar Section
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "OCT",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "2023",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          // Calendar Grid (Static for Demo)
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                            ),
                            itemCount: 28, // Total days (example static)
                            itemBuilder: (context, index) {
                              return Center(
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    // Birthday Section
                    _buildSpecialDayCard(
                      context,
                      title: "Today Birthday",
                      icon: Icons.cake,
                      total: 2,
                      buttonText: "Birthday Wishing",
                    ),
                    SizedBox(height: 16),
                    // Anniversary Section
                    _buildSpecialDayCard(
                      context,
                      title: "Anniversary",
                      icon: Icons.people,
                      total: 3,
                      buttonText: "Anniversary Wishing",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialDayCard(BuildContext context,
      {required String title,
        required IconData icon,
        required int total,
        required String buttonText}) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF3C3449),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Row(
            children: [
              Text(
                "✨ ",
                style: TextStyle(fontSize: 18, color: Colors.yellow),
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                "✨",
                style: TextStyle(fontSize: 18, color: Colors.yellow),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.deepPurple.withOpacity(0.5),
                backgroundImage: AssetImage("assets/images/avatar.jpg"),
              ),
              SizedBox(width: 8),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.deepPurple.withOpacity(0.5),
                backgroundImage: AssetImage("assets/images/avatar.jpg"),
              ),
            ],
          ),
          SizedBox(height: 30),
          // Icons Section
          Row(
            children: [
              Icon(icon, color: Colors.white, size: 24),
              SizedBox(width: 8),
              Text(
                "Total",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(width: 4),
              Text(
                "$total",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF786FEF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
