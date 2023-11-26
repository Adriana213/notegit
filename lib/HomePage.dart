import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Home Page'),
     ),
      body: Center(
       child: Column(
         children: [
           Image.asset(
             'assets/logo.png',
           ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
               onPressed: () {
                 Navigator.pushNamed(context, '/student');
               },
              child: Text('Student'),
            ),
            SizedBox(
                height: 25.0
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
              ),
            onPressed: () {
              Navigator.pushNamed(context, '/teacher');
                },
                child: Text('Teacher'),
                ),
                ],
       ),
      ),
    );
 }
}
