import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});
  // ✅ Key parameter added

  @override
  State<WeatherForecastScreen> createState() => WeatherForecastScreenState();
}

class WeatherForecastScreenState extends State<WeatherForecastScreen> {
  // ✅ Made public
  final String apiKey =
      'f08358b0c70443df96640240253003'; // Replace with your actual API key
  final String city = 'Kolkata';

  List<Map<String, String>> weeklyForecast = [];
  List<Map<String, String>> alerts = [];

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final url = Uri.parse(
      'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=7&alerts=yes',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        debugPrint(
          "API Response: ${response.body}",
        ); // ✅ Replaced print with debugPrint

        setState(() {
          weeklyForecast =
              (data['forecast']['forecastday'] as List<dynamic>)
                  .map(
                    (day) => {
                      'day': day['date'].toString(),
                      'description':
                          '${day['day']['condition']['text']}, '
                          '${day['day']['avgtemp_c'].toString()}°C',
                    },
                  )
                  .toList();

          alerts =
              (data['alerts'] != null &&
                      data['alerts']['alert'] != null &&
                      data['alerts']['alert'].isNotEmpty)
                  ? (data['alerts']['alert'] as List<dynamic>)
                      .map(
                        (alert) => {
                          'title': alert['headline'].toString(),
                          'message': alert['desc'].toString(),
                          'type': alert['severity'].toString(),
                        },
                      )
                      .toList()
                  : [];
        });
      } else {
        debugPrint(
          'API Error: ${response.statusCode} - ${response.body}',
        ); // ✅ Debugging
      }
    } catch (e) {
      debugPrint('Error fetching weather data: $e'); // ✅ Debugging
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Weather Forecast'),
        actions: const [
          CircleAvatar(backgroundImage: AssetImage('assets/profile.jpg')),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Weekly Weather Overview',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child:
                  weeklyForecast.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                        itemCount: weeklyForecast.length,
                        itemBuilder: (context, index) {
                          return _buildWeatherCard(
                            weeklyForecast[index]['day']!,
                            weeklyForecast[index]['description']!,
                          );
                        },
                      ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Current Alerts',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            alerts.isEmpty
                ? const Text("No alerts at the moment.")
                : Column(
                  children:
                      alerts.map((alert) {
                        return _buildAlertCard(
                          FontAwesomeIcons
                              .triangleExclamation, // ✅ Updated deprecated icon
                          Colors.red,
                          alert['title']!,
                          alert['message']!,
                        );
                      }).toList(),
                ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
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

  Widget _buildWeatherCard(String day, String description) {
    return Card(
      child: ListTile(
        title: Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }

  Widget _buildAlertCard(
    IconData icon,
    Color color,
    String title,
    String message,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: color),
        ),
        subtitle: Text(message),
      ),
    );
  }
}
