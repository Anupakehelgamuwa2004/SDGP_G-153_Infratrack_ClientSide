import 'package:flutter/material.dart';

/// A screen that displays details about a specific issue (e.g. pothole).
class IssueNearbyScreen extends StatelessWidget {
  const IssueNearbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Primary background color
    const Color backgroundColor = Color(0xFFEAF4FB);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Pothole Details',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // Title container
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(24),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Pothole in Nugegoda',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Images row
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Image 1
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          // Replace with your own image or asset
                          'assets/png/pothole_1.jpg',
                          fit: BoxFit.cover,
                          height: 120,
                        ),
                      ),
                    ),
                  ),
                  // Image 2
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          // Replace with your own image or asset
                          'assets/png/pothole_2.jpg',
                          fit: BoxFit.cover,
                          height: 120,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Description section
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      '''Pothole Size: Approximately 2 feet wide and 6 inches deep
Reported Condition: Large pothole causing significant vehicle swerves and congestion during peak hours. Visible cracks and loose gravel around the edges, making it prone to further expansion.
Impact: Daily traffic disruptions with an increased risk of accidents, especially for motorcyclists and cyclists.
Suggested Repair: Immediate patching to prevent further deterioration and to improve road safety.''',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Issue Location section
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      'Issue Location',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // Map placeholder
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(8),
                    ),
                    child: Image.network(
                      // Replace with your own map image or use a real Map widget
                      'assets/png/map_1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80), // extra bottom padding
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          // Add new action if needed
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom navigation bar (optional)
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home_outlined, size: 28),
              onPressed: () {
                // Already on Home Screen
              },
            ),
            const SizedBox(width: 40), // spacing for the FAB
            IconButton(
              icon: const Icon(Icons.history, size: 28),
              onPressed: () {
                // Navigate to History Screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
