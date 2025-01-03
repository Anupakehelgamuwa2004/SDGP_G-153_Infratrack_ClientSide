import 'package:flutter/material.dart';
// Import the file where your IssueNearbyScreen is located
import 'package:infratrack/screens/issue_nearby_screen/issue_nearby.dart';
// Example import for SignUpScreen. Adjust path as needed.
import 'package:infratrack/screens/sign_up_screen/sing_up.dart';

/// This is the HomeScreen with a list of [IssueCard] widgets.
/// Tapping on "Pothole in Nugegoda" navigates to the IssueNearbyScreen.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F4FF), // Light blue background

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open Drawer
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 30,
              color: Colors.black87,
            ),
            onPressed: () {
              // Example: Navigate to a profile screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const ProfileScreen(),
              //   ),
              // );
            },
          ),
        ],
      ),

      // Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
              ),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Logout Button
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black87),
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                // Navigate to SignUpScreen or any other screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
            ),
          ],
        ),
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Logo (Adjust as needed)
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/png/logo123.png',
                    height: 200,
                  ),
                ],
              ),
            ),

            // Issue Cards
            Expanded(
              child: ListView(
                children: [
                  // First issue card (navigates to IssueNearbyScreen)
                  IssueCard(
                    title: 'Pothole in Nugegoda',
                    description:
                        'A blocked drainage system in Kohuwala is leading to waterlogging during rains.',
                    onTap: () {
                      // Navigate to IssueNearbyScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const IssueNearbyScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 40),

                  // Another example card
                  IssueCard(
                    title: 'Overgrown Tree',
                    description:
                        'A blocked drainage system in Kohuwala is leading to waterlogging during rains.',
                    onTap: () {
                      // You can navigate to the same screen or a different one
                      // For now, it does nothing.
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
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

      // Floating Action Button
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.orangeAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40), // Rounded corners
          ),
          onPressed: () {
            // Add functionality to add a new report
          },
          child: const Icon(Icons.add, size: 30),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

/// Custom Widget for Issue Card
class IssueCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onTap;

  const IssueCard({
    super.key,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF1A2B43), // Dark background for card
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
