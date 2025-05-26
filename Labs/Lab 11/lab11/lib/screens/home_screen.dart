import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  HomeScreen({super.key});
  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Access theme properties
    final theme = Theme.of(context);
    
    return Scaffold(
      // No need to set backgroundColor as it will use the theme's scaffoldBackgroundColor
      appBar: AppBar(
        title: Text('Home'),
        // No need to customize AppBar colors as they come from the theme
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the App!',
              style: theme.textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // Button styling comes from the theme
              child: Text("Go to Profile"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfileScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
