import 'package:flutter/material.dart';

class SustainableCropPracticesScreen extends StatelessWidget {
  SustainableCropPracticesScreen({
    super.key,
  }); // ✅ Removed `const` due to non-constant list

  final List<Map<String, String>> practices = [
    {
      'title': 'Crop Rotation',
      'description': 'Enhances soil fertility.',
      'rating': '4.5',
      'image': 'assets/crop_rotation.jpg',
    },
    {
      'title': 'Composting',
      'description': 'Reduces waste and enriches soil.',
      'rating': '4.7',
      'image': 'assets/composting.jpg',
    },
    {
      'title': 'Cover Cropping',
      'description': 'Prevents erosion and improves soil health.',
      'rating': '4.6',
      'image': 'assets/cover_cropping.jpg',
    },
    {
      'title': 'Drip Irrigation',
      'description': 'Saves water and boosts yield.',
      'rating': '4.8',
      'image': 'assets/drip_irrigation.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sustainable Crop Practices'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: practices.length,
        itemBuilder: (context, index) {
          final practice = practices[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: Image.asset(
                practice['image']!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.image_not_supported),
              ),
              title: Text(
                practice['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(practice['description']!),
                  const SizedBox(height: 5),
                  Text(
                    'User Rating: ${practice['rating']}/5',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // ✅ Navigation to details screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              CropPracticeDetailScreen(practice: practice),
                    ),
                  );
                },
                child: const Text('Learn More'),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4, // ✅ Set correct active tab index
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/dashboard');
              break;
            case 1:
              Navigator.pushNamed(context, '/weather');
              break;
            case 2:
              Navigator.pushNamed(context, '/pest');
              break;
            case 3:
              Navigator.pushNamed(context, '/irrigation');
              break;
            case 4:
              Navigator.pushNamed(context, '/market_prices');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.wb_sunny), label: 'Weather'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bug_report),
            label: 'Pest Control',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water_drop),
            label: 'Irrigation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Market Prices',
          ),
        ],
      ),
    );
  }
}

// ✅ Implementing Crop Practice Detail Screen
class CropPracticeDetailScreen extends StatelessWidget {
  final Map<String, String> practice;

  const CropPracticeDetailScreen({super.key, required this.practice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(practice['title']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              practice['image']!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported, size: 100),
            ),
            const SizedBox(height: 16),
            Text(
              practice['title']!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              practice['description']!,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'User Rating: ${practice['rating']}/5',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
