import 'package:flutter/material.dart';

import '../../views/dashboard_screen.dart';
import 'maze_widget_3.dart';

class LevelThree extends StatelessWidget {
  const LevelThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Level 03",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
            Text(
              "The boys in the class (play, plays) soccer after school.",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
            Container(
              width: 500,
              height: 600,
              child: Stack(
                children: [
                  MazeLevelThree(),
                  Positioned(
                    left: 13,
                    bottom: 110,
                    child: Text(
                      "play",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 130,
                    right: 0,
                    child: Center(
                      child: Text(
                        "plays",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DashboardScreen())),
                child: Text(
                  "Close",
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
