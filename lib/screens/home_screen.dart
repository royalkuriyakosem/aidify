import 'package:flutter/material.dart';
import 'package:aidify/services/supabase_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aidify Features',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white, // White text color
          ),
        ),
        backgroundColor: const Color(0xFF6200EE), // Primary color for app bar
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white), // White logout icon
            onPressed: () async {
              await SupabaseService.signOut();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 16, // Spacing between columns
          mainAxisSpacing: 16, // Spacing between rows
          children: [
            _buildFeatureCard(
              context,
              'Text to Speech',
              Icons.record_voice_over,
              'Convert text to spoken words',
                  () {
                // Add navigation or functionality here
              },
            ),
            _buildFeatureCard(
              context,
              'Speech to Text',
              Icons.mic,
              'Convert speech to written text',
                  () {
                // Add navigation or functionality here
              },
            ),
            _buildFeatureCard(
              context,
              'Object Detection',
              Icons.camera_alt,
              'Identify objects using camera',
                  () {
                // Add navigation or functionality here
              },
            ),
            _buildFeatureCard(
              context,
              'Settings',
              Icons.settings,
              'Customize app settings',
                  () {
                // Add navigation or functionality here
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
      BuildContext context,
      String title,
      IconData icon,
      String description,
      VoidCallback onTap,
      ) {
    return Card(
      elevation: 4, // Shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8), // Rounded corners for InkWell
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: Theme.of(context).primaryColor, // Primary color for icons
              ),
              const SizedBox(height: 8), // Spacing between icon and title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Black text color for title
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4), // Spacing between title and description
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey, // Grey text color for description
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
