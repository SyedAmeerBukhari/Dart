import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/customtextfild.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final userEmail = FirebaseAuth.instance.currentUser!.email!;
  late DocumentReference userDoc;
  Map<String, dynamic> userData = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    userDoc = FirebaseFirestore.instance.collection('users').doc(userEmail);
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final snapshot = await userDoc.get();
    setState(() {
      userData = snapshot.data() as Map<String, dynamic>? ?? {};
      isLoading = false;
    });
  }

  Future<void> updateUserData(Map<String, dynamic> updatedData) async {
    await userDoc.update(updatedData);
    await fetchUserData();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Profile updated successfully!')));
  }

  Future<void> deleteFieldByName(String fieldName) async {
    final key = userData.keys.firstWhere(
      (k) => k.toLowerCase() == fieldName.toLowerCase(),
      orElse: () => '',
    );

    if (key.isNotEmpty) {
      await userDoc.update({key: FieldValue.delete()});
      await fetchUserData();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Field "$key" deleted successfully!')),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Field "$fieldName" not found.')));
    }
  }

  void showUpdateDialog() {
    final controllers = {
      for (var entry in userData.entries)
        entry.key: TextEditingController(text: entry.value.toString()),
    };

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Update Profile"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    controllers.entries.map((entry) {
                      return CustomTextField(
                        controller: entry.value,
                        label: entry.key,
                      );
                    }).toList(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  final updatedData = {
                    for (var e in controllers.entries)
                      e.key: e.value.text.trim(),
                  };
                  Navigator.of(context).pop();
                  updateUserData(updatedData);
                },
                child: Text("Update"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
            ],
          ),
    );
  }

  void showDeleteDialog() {
    final fieldController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Delete Field"),
            content: CustomTextField(
              controller: fieldController,
              label: "Enter field name",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  final field = fieldController.text.trim();
                  Navigator.pop(context);
                  deleteFieldByName(field);
                },
                child: Text("Delete"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: Icon(Icons.edit), onPressed: showUpdateDialog),
          IconButton(icon: Icon(Icons.delete), onPressed: showDeleteDialog),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: fetchUserData,
        child:
            isLoading
                ? Center(child: CircularProgressIndicator())
                : userData.isEmpty
                ? ListView(
                  children: [
                    SizedBox(height: 200),
                    Center(child: Text("No user data found")),
                  ],
                )
                : ListView(
                  padding: EdgeInsets.all(16),
                  children:
                      userData.entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "${entry.key}: ${entry.value}",
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      }).toList(),
                ),
      ),
    );
  }
}
