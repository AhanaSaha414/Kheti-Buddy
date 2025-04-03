import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PestDetectionScreen extends StatelessWidget {
  const PestDetectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Pest Detection'),
        actions: [
          const CircleAvatar(backgroundImage: AssetImage('assets/profile.jpg')),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.image,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Upload your crop image'),
                  const SizedBox(height: 10),
                  const Text('Or'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Browse device photos'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Image.asset('assets/citrus_crop.png', height: 80, width: 80),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Detection Summary: We detected some issues with your crop.',
                      ),
                      Text(
                        'Healthy leaves: 84%, Citrus canker: 11%, Citrus greening: 7%',
                      ),
                      Text(
                        'See more details',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Recommended Treatments:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildTreatment(
              FontAwesomeIcons.userDoctor,
              'For detailed treatments, please consult your local expert.',
            ),
            _buildTreatment(
              FontAwesomeIcons.sprayCan,
              'Apply disinfectant to tools using a lint-free cloth.',
            ),
            _buildTreatment(
              FontAwesomeIcons.seedling,
              'Use certified disease-free plants and planting materials.',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Pests tab selected
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Weather'),
          BottomNavigationBarItem(icon: Icon(Icons.bug_report), label: 'Pests'),
          BottomNavigationBarItem(icon: Icon(Icons.waves), label: 'Irrigation'),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights),
            label: 'Market Insights',
          ),
        ],
      ),
    );
  }

  Widget _buildTreatment(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(text),
    );
  }
}
