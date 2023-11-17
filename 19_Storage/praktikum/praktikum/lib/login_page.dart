import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'contact_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Color(0xFF6750A4), // Set the AppBar color
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _login(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF6750A4), // Set the button color
              ),
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  _login(BuildContext context) async {
    final String username = usernameController.text;
    final String password = passwordController.text;

    // Replace this with your actual authentication logic
    if (username == "Nurmala Sari" && password == "123") {
      // Save the username to shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("username", username);

      // Navigate to the Contacts page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ContactPage()),
      );
    } else {
      // Show an error message for unsuccessful login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid username or password"),
        ),
      );
    }
  }
}
