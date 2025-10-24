import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homepage',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'label': 'CCS', 'icon': Icons.computer},
    {'label': 'COA', 'icon': Icons.school},
    {'label': 'CBAE', 'icon': Icons.business_center},
    {'label': 'EDUC', 'icon': Icons.menu_book},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),

          // LOGO (Conditional rendering: if image fails, show placeholder)
          Center(
            child: ClipOval(
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtwXNMuk0CMZQpVbXdg-7jx9Oo4_VOXnI5LA&s', // Fixed URL
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Icon(Icons.image, size: 50)),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 30),

          // Buttons (Grid View)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: items.map((item) {
                  return GestureDetector(
                    onTap: () {
                      // Tap navigation
                      print("Tapped on ${item['label']}");
                    },
                    child: Card(
                      color: Colors.grey[300],
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(item['icon'], size: 40),
                          SizedBox(height: 10),
                          Text(
                            item['label'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
