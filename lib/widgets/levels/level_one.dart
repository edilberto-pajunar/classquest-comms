import 'dart:math';

import 'package:classquest/provider/random_word_provider.dart';
import 'package:classquest/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'maze_widget_1.dart';
import 'maze_widget_2.dart';

class LevelOne extends StatefulWidget {
  LevelOne({super.key});

  @override
  State<LevelOne> createState() => _LevelOneState();
}

class _LevelOneState extends State<LevelOne> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RandomWordProvider>(context, listen: false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Consumer<RandomWordProvider>(
            builder: (context, value, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Level 01",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  "${provider.currentWord}",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(
                  height: 600,
                  width: 500,
                  child: Stack(
                    children: [
                      MazeLevelOne(),
                      Positioned(
                        left: 0,
                        bottom: 310,
                        child: Text(
                          provider.currentFirst,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 310,
                        right: 0,
                        child: Center(
                          child: Text(
                            provider.currentSecond,
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
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen())),
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
        ),
      ],
    );
  }
}
