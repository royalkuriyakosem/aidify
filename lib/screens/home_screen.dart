import 'package:flutter/material.dart';
import 'package:aidify/services/supabase_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _userName;

  @override
  void initState() {
    super.initState();
    _fetchUserName();
  }

  Future<void> _fetchUserName() async {
    final name = await SupabaseService.getUserName();
    setState(() {
      _userName = name;
    });
  }

  Future<void> _logout(BuildContext context) async {
    await SupabaseService.signOut();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Implement logout functionality
            },
          ),
        ],
      ),
      body: Center(
        child: _userName != null
            ? Text(
                'Welcome, $_userName!',
                style: const TextStyle(fontSize: 24),
              )
            : const CircularProgressIndicator(), // Show loading indicator while fetching
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility), label: 'Quick Access'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payments'),
          BottomNavigationBarItem(
              icon: Icon(Icons.document_scanner), label: 'Doc'),
        ],
        currentIndex: 1, // Set the current index to Quick Access
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),
    );
  }

  Widget _buildGridItem(
      BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
