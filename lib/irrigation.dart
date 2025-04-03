import 'package:flutter/material.dart';

class SmartIrrigationScreen extends StatelessWidget {
  const SmartIrrigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Smart Irrigation"),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage(
              "assets/profile.jpg",
            ), // ✅ Ensure this exists
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Irrigation",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Current soil moisture: 34%",
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            const SizedBox(height: 16),
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.show_chart, size: 80, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  irrigationAlert(
                    "Irrigation Alert",
                    "Soil moisture at 60%",
                    "10 mins ago",
                  ),
                  irrigationAlert(
                    "Water Now",
                    "Immediate irrigation needed",
                    "15 mins ago",
                  ),
                  irrigationAlert(
                    "Schedule Update",
                    "Next irrigation at 3 PM",
                    "30 mins ago",
                  ),
                  irrigationAlert(
                    "Check System",
                    "Possible sensor error",
                    "45 mins ago",
                  ),
                  irrigationAlert(
                    "Irrigation Complete",
                    "Zone 1 watered successfully",
                    "1 hour ago",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // ✅ Highlight Irrigation tab
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/dashboard');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/weather');
              break;
            case 2:
              break; // Stay on this screen
            case 3:
              Navigator.pushReplacementNamed(context, '/pest');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Weather"),
          BottomNavigationBarItem(
            icon: Icon(Icons.opacity),
            label: "Irrigation",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.bug_report), label: "Pest"),
        ],
      ),
    );
  }

  Widget irrigationAlert(String title, String description, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(description, style: const TextStyle(color: Colors.black54)),
          Text(time, style: const TextStyle(color: Colors.grey)),
          const Divider(),
        ],
      ),
    );
  }
}
