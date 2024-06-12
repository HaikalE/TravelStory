import 'details_page.dart';
import 'package:flutter/material.dart';
import 'explore.dart';

class BookmarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Bookmarks',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Color(0xFFE3F2FD), // Light blue background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildBookmarkItem(context, 'Colosseum', 'Rome, Italy', 'assets/colosseum.png'),
            buildBookmarkItem(context, 'Mount Bromo', 'Indonesia', 'assets/mount_bromo.png'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: 1, // Since this is the Bookmark page, index is 1
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExplorePage()),
            );
          } else if (index == 1) {
            // Current page is Bookmark, do nothing
          } else if (index == 2) {
            // Navigate to the Profile page or handle accordingly
          }
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  Widget buildBookmarkItem(BuildContext context, String title, String subtitle, String imagePath) {
    return Card(
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                title: title,
                subtitle: subtitle,
                imagePath: imagePath,
                price: 50.0, // Example price, change as needed
                location: 'East Java, Indonesia', // Example location, change as needed
                openingTime: '09:00 AM', // Example opening time, change as needed
              ),
            ),
          );
        },
      ),
    );
  }
}
