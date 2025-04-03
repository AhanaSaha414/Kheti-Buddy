import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  final List<Map<String, String>> solutions = const [
    {
      'title':
          'Monitor and control irrigation systems and Track crop growth and yield.',
      'image': 'assets/smart_irrigation.jpeg',
    },
    {
      'title': 'Sustainable crop practices.',
      'image': 'assets/sustainable.jpeg',
    },
    {
      'title': 'Available government schemes',
      'image': 'assets/govt_scheme.jpeg',
    },
    {
      'title': 'Access real-time weather updates.',
      'image': 'assets/weather.jpeg',
    },
    {
      'title': 'Check market prices and trends.',
      'image': 'assets/market_price.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Dashboard", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [IconButton(icon: const Icon(Icons.menu), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for solutions...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Solutions List
            Expanded(
              child: ListView.builder(
                itemCount: solutions.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      leading: Image.asset(
                        solutions[index]['image']!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      title: Text(solutions[index]['title']!),
                    ),
                  );
                },
              ),
            ),

            // Chat Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  const Text(
                    "Have questions?\nJust ask.",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Open Chat",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "OR  Ask AI_BUDDY",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Weather'),
          BottomNavigationBarItem(icon: Icon(Icons.bug_report), label: 'Pests'),
          BottomNavigationBarItem(icon: Icon(Icons.water), label: 'Irrigation'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Market Insights',
          ),
        ],
      ),
    );
  }
}
