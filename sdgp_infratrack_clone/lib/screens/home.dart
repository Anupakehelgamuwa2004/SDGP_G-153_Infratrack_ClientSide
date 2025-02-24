import 'package:flutter/material.dart';

void main() {
  runApp(const InfraTrackApp());
}

class InfraTrackApp extends StatelessWidget {
  const InfraTrackApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infra Track',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/add_report': (context) => const AddReportScreen(),
        // Add other routes/screens if needed
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Add logic to switch screens if desired:
    // if (index == 0) { /* Show home content */ }
    // else if (index == 1) { /* Show history content */ }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Light blue-ish background
      backgroundColor: const Color(0xFFEAF3FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Open drawer or do something else
          },
        ),
        centerTitle: true,
        title: const Text(
          'HOME',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {
              // Navigate to profile or do something else
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Column(
              children: [
                // Placeholder for your logo image.
                // Replace 'assets/logo.png' with the actual path to your image.
                SizedBox(
                  height: 64,
                  child: Image.asset(
                    'assets/infra_track_logo',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'INFRA TRACK',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'ONE ROAD AT A TIME',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF2C3E50),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // High Priority Issues
            _PriorityCard(
              label: 'High Priority Issues',
              circleColor: Colors.red,
              icon: Icons.error,
              onTap: () {
                // Navigate / do something
              },
            ),
            // Mid Priority Issues
            _PriorityCard(
              label: 'Mid Priority Issues',
              circleColor: Colors.yellow,
              icon: Icons.priority_high,
              onTap: () {
                // Navigate / do something
              },
            ),
            // Low Priority Issues
            _PriorityCard(
              label: 'Low Priority Issues',
              circleColor: Colors.green,
              icon: Icons.check_circle,
              onTap: () {
                // Navigate / do something
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
      // Use the custom BottomNavigation widget:
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class _PriorityCard extends StatelessWidget {
  final String label;
  final Color circleColor;
  final IconData icon;
  final VoidCallback onTap;

  const _PriorityCard({
    Key? key,
    required this.label,
    required this.circleColor,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF2C3E50),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: circleColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy screen to show if FAB is tapped to add a report
class AddReportScreen extends StatelessWidget {
  const AddReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Report'),
      ),
      body: const Center(
        child: Text('Add Report Screen'),
      ),
    );
  }
}

// BELOW IS YOUR BOTTOM NAVIGATION WIDGET EXACTLY AS GIVEN:

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Ensures the nav bar doesn't overlap system UI elements
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 32),
        height: 90,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFFEBF8FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // Row with two interactive nav items.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavItem(
                  icon: Icons.home,
                  label: "Home",
                  isSelected: selectedIndex == 0,
                  onTap: () => onItemTapped(0),
                ),
                NavItem(
                  icon: Icons.timelapse, // Modern icon for history
                  label: "History",
                  isSelected: selectedIndex == 1,
                  onTap: () => onItemTapped(1),
                ),
              ],
            ),
            // Center FAB positioned to overlap the nav bar.
            Positioned(
              top: -30,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: FloatingActionButton(
                  backgroundColor: const Color(0xFF2C3E50),
                  onPressed: () {
                    Navigator.pushNamed(context, "/add_report");
                  },
                  child: const Icon(Icons.add, size: 36, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        width: 80,
        height: 60,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2C3E50) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: isSelected
              ? null
              : Border.all(color: const Color(0xFF2C3E50), width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: isSelected ? 1.2 : 1.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              child: Icon(
                icon,
                color: isSelected ? Colors.white : const Color(0xFF2C3E50),
                size: 28,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF2C3E50),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
