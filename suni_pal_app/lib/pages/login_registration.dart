import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          TextFormField(
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
              onPressed: () {}, 
              style: FilledButton.styleFrom(
                foregroundColor: Colors.cyan,
              ),
              child: Text('Click me'),
            ),


        ],
      )
    );
  }
}