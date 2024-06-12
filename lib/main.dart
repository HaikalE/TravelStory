import 'package:flutter/material.dart';
import 'explore.dart'; // Import the new page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/explore': (context) => ExplorePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3F2FD), // Light blue background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start, // Center-align the text
            mainAxisSize: MainAxisSize.min, // Set the column size to the minimum required
            children: [
              Text(
                "LET'S",
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF546E7A), // Darker blue color
                ),
              ),
              Text(
                "EXPLORE",
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFF1A237E), // Dark blue color
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "THE WORLD",
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF546E7A), // Darker blue color
                ),
              ),
              SizedBox(height: 10), // Adding some space between texts
              Container(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Faucibus faucibus tortor, suscipit velit phasellus massa.",
                  textAlign: TextAlign.left, // Align text to the left
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    width: double.infinity, // Set button width to fill the available space
                    height: 50, // Set button height
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF1E88E5), Color(0xFFBBDEFB)], // Blue to light blue gradient
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 1.0],
                        transform: GradientRotation(45 * 3.141592 / 180), // 45 degree rotation
                      ),
                      borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    ),
                  ),
                  Positioned.fill(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/explore');
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // No padding
                      ),
                      child: Center(
                        child: Text(
                          "ENTER",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold, // Bold text
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/img.png', // Add your image to the assets folder and reference it here
                  height: 300, // Adjusted height for better appearance
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
