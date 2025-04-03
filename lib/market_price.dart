import 'package:flutter/material.dart';

class MarketPricePredictionScreen extends StatelessWidget {
  const MarketPricePredictionScreen({super.key}); // ✅ Super parameter fix

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Market Price Prediction"),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage(
              "assets/profile.jpg",
            ), // ✅ Ensure asset exists
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Graph placeholder
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

            // ✅ Market Price Cards
            marketPriceCard("Wheat", "Wheat price up 3%.", "1h ago"),
            marketPriceCard("Corn", "Corn price steady.", "2h ago"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4, // ✅ Highlight Market Prices tab
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/dashboard');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/weather');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/pest');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/irrigation');
              break;
            case 4:
              break; // Stay on this screen
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Weather"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bug_report),
            label: "Pest Control",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.opacity),
            label: "Irrigation",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights),
            label: "Market Prices",
          ),
        ],
      ),
    );
  }

  // ✅ Market Price Card Widget
  Widget marketPriceCard(String crop, String description, String updateTime) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              crop,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(description, style: const TextStyle(color: Colors.black87)),
            const SizedBox(height: 4),
            Text(
              "Last updated: $updateTime",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle details navigation
                },
                child: const Text(
                  "View Details",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
