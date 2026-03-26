import 'package:flutter/material.dart';
import 'package:suni_pal_app/pages/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter email address',
              ),
              onEditingComplete: () {
                setState(() {
                  
                });
              },
            ),

          FilledButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(
                    builder: (context) {
                      return Homepage();
                    },
                    ),
                );
              }, 
              style: FilledButton.styleFrom(
                foregroundColor: Colors.cyan,
              ),
              child: Text('Click me'),
            ),
          ],
        ),
      ),
    );
  }
}