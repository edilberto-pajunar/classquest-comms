import 'package:flutter/material.dart';

import '../../views/dashboard_screen.dart';
import 'maze_widget_2.dart';

class LevelTwo extends StatelessWidget {
  const LevelTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
            "The book (has, have) an interesting plot.",
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
                MazeLevelTwo(),
                Positioned(
                  left: 170,
                  top: 0,
                  child: Text(
                    "has",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 305,
                  right: 0,
                  child: Center(
                    child: Text(
                      "have",
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
    );
  }
}
