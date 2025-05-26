import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/customtextfild.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  String? gender;

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  void signupUser() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await _firestore
          .collection('users')
          .doc(emailController.text.trim())
          .set({
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'age': ageController.text.trim(),
        'gender': gender,
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Signup successful!")));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              controller: nameController,
              label: "Name",
            ),
            CustomTextField(
              controller: emailController,
              label: "Email",
              inputType: TextInputType.emailAddress,
            ),
            CustomTextField(
              controller: passwordController,
              label: "Password",
              isObscure: true,
            ),
            CustomTextField(
              controller: ageController,
              label: "Age",
              inputType: TextInputType.number,
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              value: gender,
              items: ['Male', 'Female', 'Other']
                  .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                  .toList(),
              onChanged: (val) => setState(() => gender = val),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: signupUser, child: Text('Sign Up')),
          ],
        ),
      ),
    );
  }
}
